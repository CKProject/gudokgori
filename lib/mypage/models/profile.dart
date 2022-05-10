import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.name,
    required this.phone,
    required this.profileImg,
    required this.serviceCount,
    required this.totalPrice,
  });

  final int id;
  final String name;
  final String phone;
  final String profileImg;
  final int serviceCount;
  final int totalPrice;

  @override
  List<Object> get props =>
      [id, name, phone, profileImg, serviceCount, totalPrice];
}
