import 'package:equatable/equatable.dart';

class ServiceSub extends Equatable {
  const ServiceSub({
    required this.id,
    required this.serviceName,
    required this.serviceImg,
    required this.serviceCategory,
    required this.simpleMemo,
    required this.subscribePrice,
    required this.startSubscribe,
    required this.payPeriod,
    required this.payPeriodUnit,
    required this.hasFreePeriod,
    required this.freePeriod,
    required this.freePeriodUnit,
  });

  final int id;
  final String serviceName;
  final String serviceImg;
  final String serviceCategory;
  final String simpleMemo;
  final int subscribePrice;
  final DateTime startSubscribe;
  final int payPeriod;
  final String payPeriodUnit;
  final bool hasFreePeriod;
  final int freePeriod;
  final String freePeriodUnit;

  @override
  List<Object> get props => [
        id,
        serviceName,
        serviceImg,
        serviceCategory,
        simpleMemo,
        simpleMemo,
        subscribePrice,
        startSubscribe,
        payPeriod,
        payPeriodUnit,
        hasFreePeriod,
        freePeriod,
        freePeriodUnit
      ];
}
