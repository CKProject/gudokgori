import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../models/alarm.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

const _alarmLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc({required this.httpClient}) : super(const AlarmState()) {
    on<AlarmFetched>(
      _onAlarmFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onAlarmFetched(
      AlarmFetched event, Emitter<AlarmState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == AlarmStatus.initial) {
        final alarms = await _fetchAlarms();
        return emit(state.copyWith(
          status: AlarmStatus.success,
          alarms: alarms,
          hasReachedMax: alarms.length < 20 ? true : false,
        ));
      }
      final alarms = await _fetchAlarms(state.alarms.length);
      emit(alarms.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: AlarmStatus.success,
              alarms: List.of(state.alarms)..addAll(alarms),
              hasReachedMax: false,
            ));
    } catch (_) {
      print(_);
      emit(state.copyWith(status: AlarmStatus.failure));
    }
  }

  final http.Client httpClient;
  Future<List<Alarm>> _fetchAlarms([int startIndex = 0]) async {
    try {
      var alarm = await FirebaseFirestore.instance
          .collection('alarm')
          .where("receiver", isEqualTo: "receiver")
          .get();
      return alarm.docs.map((doc) {
        print(doc['receiver']);
        return Alarm(id: 0, receiver: doc['receiver'], body: doc['content']);
      }).toList();
    } catch (_) {
      print(_);
      throw Exception('error fetching Alarms : $_');
    }
  }
}
