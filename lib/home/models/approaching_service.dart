import 'package:equatable/equatable.dart';

class ApproachingService extends Equatable {
  const ApproachingService(
      {required this.remainDate, required this.serviceName});

  final int remainDate;
  final String serviceName;

  @override
  List<Object> get props => [remainDate, serviceName];
}
