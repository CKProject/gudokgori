import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:gudokgori/mypage/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'mypage_event.dart';
part 'mypage_state.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MyPageBloc extends Bloc<MyPageEvent, MyPageState> {
  MyPageBloc({required this.httpClient}) : super(const MyPageState()) {
    on<MyPageFetched>(
      _onMyPageFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onMyPageFetched(
      MyPageFetched event, Emitter<MyPageState> emit) async {
    try {
      final profile = await _fetchMyPages(state.profile.phone);
      emit(state.copyWith(
        status: MyPageStatus.success,
        profile: profile,
      ));
    } catch (_) {
      emit(state.copyWith(status: MyPageStatus.failure));
    }
  }

  final http.Client httpClient;
  Future<Profile> _fetchMyPages(String phone) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/MyPages',
        <String, String>{'phone': phone},
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final body = json.decode(response.body) as List;
      return body
          .map((dynamic json) {
            return Profile(
              id: json['id'] as int,
              name: json['name'] as String,
              phone: json['phone'] as String,
              profileImg: json['profileImg'] as String,
              serviceCount: json['serviceCount'] as int,
              totalPrice: json['totalPrice'] as int,
            );
          })
          .toList()
          .first;
    }
    throw Exception('error fetching MyPages');
  }
}
