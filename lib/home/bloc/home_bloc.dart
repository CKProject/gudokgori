import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gudokgori/home/models/home_service.dart';
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
  HomeBloc() : super(const HomeState()) {
    on<HomeInit>(
      _onHomeInit,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> _onHomeInit(HomeInit event, Emitter<HomeState> emit) async {
    if (state.status == HomeStatus.initial) {
      try {
        final home =
            Home(totalPrice: 0, payedPrice: 0, approachingServices: []);
        final services = await _fetchPosts();

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

  Future<List<HomeService>> _fetchPosts([int startIndex = 0]) async {
    try {
      var subscribes = await FirebaseFirestore.instance
          .collection('subscribes')
          .where("userPhone", isEqualTo: '01012345678')
          .get();
      return subscribes.docs
          .map(
            (sub) => HomeService(
                serviceId: 0,
                serviceName: sub['serviceName'],
                serviceImg: sub['serviceImg'] as String,
                startDate: (sub['startSubscribe'] as Timestamp).toDate(),
                remainDate: 0),
          )
          .toList();
    } catch (_) {
      print(_);
      throw Exception('error fetching posts');
    }
  }
}
