part of 'service_sub_bloc.dart';

enum ServiceSubStatus { initial, success, failure }

class ServiceSubState extends Equatable {
  const ServiceSubState({
    required this.serviceSub,
  });

  final ServiceSub serviceSub;

  ServiceSubState copyWith({
    ServiceSub? serviceSub,
  }) {
    return ServiceSubState(
      serviceSub: serviceSub ?? this.serviceSub,
    );
  }

  @override
  String toString() {
    return '''ServiceSubState { ServiceSubs: $serviceSub }''';
  }

  @override
  List<Object> get props => [serviceSub];
}
