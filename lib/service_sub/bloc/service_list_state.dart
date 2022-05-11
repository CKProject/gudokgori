part of 'service_list_bloc.dart';

enum ServiceListStatus { initial, success, failure }

class ServiceListState extends Equatable {
  const ServiceListState({
    this.status = ServiceListStatus.initial,
    this.serviceList = const <ServiceList>[],
  });

  final ServiceListStatus status;
  final List<ServiceList> serviceList;

  ServiceListState copyWith({
    ServiceListStatus? status,
    List<ServiceList>? serviceList,
  }) {
    return ServiceListState(
      status: status ?? this.status,
      serviceList: serviceList ?? this.serviceList,
    );
  }

  @override
  String toString() {
    return '''ServiceListState { status: $status, ServiceLists: ${serviceList.length} }''';
  }

  @override
  List<Object> get props => [status, serviceList];
}
