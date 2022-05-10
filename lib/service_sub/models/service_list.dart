import 'package:equatable/equatable.dart';

class ServiceList extends Equatable {
  const ServiceList({
    required this.id,
    required this.serviceName,
    required this.serviceImg,
    required this.serviceCategory,
  });

  final int id;
  final String serviceName;
  final String serviceImg;
  final String serviceCategory;

  @override
  List<Object> get props => [
        id,
        serviceName,
        serviceImg,
        serviceCategory,
      ];
}
