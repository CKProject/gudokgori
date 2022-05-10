part of 'service_list_bloc.dart';

enum ServiceListStatus { initial, success, failure }

class ServiceListState extends Equatable {
  const ServiceListState({
    this.status = ServiceListStatus.initial,
    this.serviceList = const <ServiceList>[],
    this.hasReachedMax = false,
  });

  final ServiceListStatus status;
  final List<ServiceList> serviceList;
  final bool hasReachedMax;

  ServiceListState copyWith({
    ServiceListStatus? status,
    List<ServiceList>? serviceList,
    bool? hasReachedMax,
  }) {
    return ServiceListState(
      status: status ?? this.status,
      serviceList: serviceList ?? this.serviceList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ServiceListState { status: $status, ServiceLists: ${serviceList.length}, hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, serviceList, hasReachedMax];
}
