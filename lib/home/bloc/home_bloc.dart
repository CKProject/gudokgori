import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gudokgori/service_sub/models/models.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInit>(
      _onHomeInit,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> _onHomeInit(HomeInit event, Emitter<HomeState> emit) async {
    if (state.status == HomeStatus.initial) {
      try {
        int total = 0;
        int payed = 0;
        List<ApproachingService> aList = [];
        final services = await _fetchPosts();
        for (var service in services) {
          total += service.subscribePrice;
          aList.add(ApproachingService(
              remainDate: service.remainDate, serviceName: service.serviceImg));
          if (service.nextPeriod.month != DateTime.now().month) {
            payed += service.subscribePrice;
          }
        }
        final home = Home(
            totalPrice: total, payedPrice: payed, approachingServices: aList);

        return emit(state.copyWith(
          status: HomeStatus.success,
          services: services,
          hasReachedMax: false,
          homes: home,
        ));
      } catch (_) {
        print(_);
        emit(state.copyWith(status: HomeStatus.failure));
      }
    }
    try {
      if (state.hasReachedMax) return;
      final services = await _fetchPosts(state.services.length);
      emit(services.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: HomeStatus.success,
              services: List.of(state.services)..addAll(services),
              hasReachedMax: false,
            ));
    } catch (_) {
      print(_);
      emit(state.copyWith(status: HomeStatus.listFailure));
    }
  }

  Future<List<ServiceSub>> _fetchPosts([int startIndex = 0]) async {
    try {
      var subscribes = await FirebaseFirestore.instance
          .collection('subscribes')
          .where("userPhone", isEqualTo: '01012345678')
          .get();

      String imgLink =
          await FirebaseStorage.instance.ref('youtube.png').getDownloadURL();

      imgLink = imgLink.split("token")[1];

      return subscribes.docs
          .map(
            (sub) => ServiceSub(
              userPhone: sub['userPhone'],
              serviceName: sub['serviceName'],
              serviceImg: sub['serviceImg'],
              serviceCategory: sub[' serviceCategory'],
              simpleMemo: sub['simpleMemo'],
              subscribePrice: sub['subscribePrice'],
              startSubscribe: (sub['startSubscribe'] as Timestamp).toDate(),
              payPeriod: sub['payPeriod'],
              payPeriodUnit: sub['payPeriodUnit'],
              hasFreePeriod: sub['hasFreePeriod'],
              freePeriod: sub['freePeriod'],
              freePeriodUnit: sub['freePeriodUnit'],
              nextPeriod: (sub['nextPeriod'] as Timestamp).toDate(),
              remainDate: (sub['nextPeriod'] as Timestamp)
                  .toDate()
                  .difference(DateTime.now())
                  .inDays,
              token: imgLink,
            ),
          )
          .toList();
    } catch (_) {
      print(_);
      throw Exception('error fetching posts');
    }
  }
}
