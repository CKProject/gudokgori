part of 'service_sub_bloc.dart';

abstract class ServiceSubEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ServiceSubFetched extends ServiceSubEvent {}
