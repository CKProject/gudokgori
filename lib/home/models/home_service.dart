import 'package:equatable/equatable.dart';

class HomeService extends Equatable {
  const HomeService(
      {required this.serviceId,
      required this.serviceName,
      required this.serviceImg,
      required this.startDate,
      required this.remainDate});

  final int serviceId;
  final String serviceName;
  final String serviceImg;
  final DateTime startDate;
  final int remainDate;

  @override
  List<Object> get props =>
      [serviceId, serviceName, serviceImg, startDate, remainDate];
}
