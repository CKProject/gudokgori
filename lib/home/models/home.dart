import 'package:equatable/equatable.dart';

import 'approaching_service.dart';

class Home extends Equatable {
  const Home(
      {required this.totalPrice,
      required this.payedPrice,
      required this.approachingServices});

  final int totalPrice;
  final int payedPrice;
  final List<ApproachingService> approachingServices;

  @override
  List<Object> get props => [totalPrice, payedPrice, approachingServices];
}
