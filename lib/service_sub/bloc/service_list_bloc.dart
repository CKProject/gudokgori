import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:gudokgori/service_sub/models/service_list.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'service_list_event.dart';
part 'service_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ServiceListBloc extends Bloc<ServiceListEvent, ServiceListState> {
  ServiceListBloc({required this.httpClient})
      : super(const ServiceListState()) {
    on<ServiceListFetched>(
      _onServiceListFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onServiceListFetched(
      ServiceListFetched event, Emitter<ServiceListState> emit) async {
    try {
      final serviceList = await _fetchServiceLists();
      emit(state.copyWith(
        status: ServiceListStatus.success,
        serviceList: serviceList,
      ));
    } catch (_) {
      emit(state.copyWith(status: ServiceListStatus.failure));
    }
  }

  final http.Client httpClient;
  Future<List<ServiceList>> _fetchServiceLists() async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/ServiceLists',
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return ServiceList(
            id: json['id'] as int,
            serviceName: json['serviceName'] as String,
            serviceImg: json['serviceImg'] as String,
            serviceCategory: json['serviceCategory'] as String);
      }).toList();
    }
    throw Exception('error fetching ServiceLists');
  }
}
