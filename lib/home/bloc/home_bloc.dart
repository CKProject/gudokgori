import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gudokgori/home/models/home_service.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../models/approaching_service.dart';
import '../models/home.dart';

part 'home_event.dart';
part 'home_state.dart';

const _serviceLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.httpClient}) : super(const HomeState()) {
    on<HomeInit>(
      _onHomeInit,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> _onHomeInit(HomeInit event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == HomeStatus.initial) {
        final services = await _fetchPosts();
        return emit(state.copyWith(
          status: HomeStatus.success,
          services: services,
          hasReachedMax: false,
        ));
      }
      final services = await _fetchPosts(state.services.length);
      emit(services.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: HomeStatus.success,
              services: List.of(state.services)..addAll(services),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<List<HomeService>> _fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_serviceLimit'},
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return HomeService(
            serviceId: json['id'] as int,
            serviceName: json['name'] as String,
            serviceImg: json['img'] as String,
            startDate: DateTime.parse(json['date']),
            remainDate: json['remain'] as int);
      }).toList();
    }
    throw Exception('error fetching posts');
  }

  final CollectionReference products =
      FirebaseFirestore.instance.collection('alarm');
  final http.Client httpClient;
}
