import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/service_sub.dart';

part 'service_sub_event.dart';
part 'service_sub_state.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ServiceSubBloc extends Bloc<ServiceSubEvent, ServiceSubState> {
  ServiceSubBloc({required this.serviceSub})
      : super(ServiceSubState(serviceSub: serviceSub)) {
    on<ServiceSubFetched>(
      _onServiceSubFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  final ServiceSub serviceSub;

  Future<void> _onServiceSubFetched(
      ServiceSubFetched event, Emitter<ServiceSubState> emit) async {
    try {
      emit(state.copyWith(
        serviceSub: serviceSub,
      ));
    } catch (_) {
      print(_);
    }
  }
}
