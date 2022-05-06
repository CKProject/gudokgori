part of 'alarm_bloc.dart';

enum AlarmStatus { initial, success, failure }

class AlarmState extends Equatable {
  const AlarmState({
    this.status = AlarmStatus.initial,
    this.alarms = const <Alarm>[],
    this.hasReachedMax = false,
  });

  final AlarmStatus status;
  final List<Alarm> alarms;
  final bool hasReachedMax;

  AlarmState copyWith({
    AlarmStatus? status,
    List<Alarm>? alarms,
    bool? hasReachedMax,
  }) {
    return AlarmState(
      status: status ?? this.status,
      alarms: alarms ?? this.alarms,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''AlarmState { status: $status, hasReachedMax: $hasReachedMax, Alarms: ${alarms.length} }''';
  }

  @override
  List<Object> get props => [status, alarms, hasReachedMax];
}
