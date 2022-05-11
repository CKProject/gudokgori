import 'package:equatable/equatable.dart';

class Alarm extends Equatable {
  const Alarm(
      {required this.id,
      required this.receiver,
      required this.body,
      required this.createAt});

  final int id;
  final String receiver;
  final String body;
  final DateTime createAt;

  @override
  List<Object> get props => [id, receiver, body, createAt];
}
