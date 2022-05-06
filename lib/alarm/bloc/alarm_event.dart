part of 'alarm_bloc.dart';

abstract class AlarmEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AlarmFetched extends AlarmEvent {}
