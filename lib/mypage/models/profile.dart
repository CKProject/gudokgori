import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.name,
    required this.phone,
    required this.profileImg,
  });

  final int id;
  final String name;
  final int phone;
  final String profileImg;

  @override
  List<Object> get props => [id, name, phone, profileImg];
}
