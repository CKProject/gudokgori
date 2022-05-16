import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gudokgori/mypage/models/models.dart';
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
  MyPageBloc() : super(const MyPageState()) {
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

  Future<Profile> _fetchMyPages(String phone) async {
    try {
      var profile = await FirebaseFirestore.instance
          .collection('user')
          .where('name', isEqualTo: 'test')
          .get();
      var userServiceList = await FirebaseFirestore.instance
          .collection('subscribes')
          .where('userPhone', isEqualTo: profile.docs.first['phone'])
          .get();
      int totalPrice = 0;
      for (var userService in userServiceList.docs) {
        totalPrice += userService['subscribePrice'] as int;
      }
      return profile.docs
          .map((doc) {
            return Profile(
                id: doc['id'],
                name: doc['name'],
                phone: doc['phone'],
                profileImg: doc['profile'],
                serviceCount: userServiceList.docs.length,
                totalPrice: totalPrice);
          })
          .toList()
          .first;
    } catch (_) {
      print(_);
      throw Exception('error fetching Alarms : $_');
    }
  }
}
