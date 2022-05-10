part of 'service_list_bloc.dart';

abstract class ServiceListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ServiceListFetched extends ServiceListEvent {}
