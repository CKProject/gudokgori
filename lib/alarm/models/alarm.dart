import 'package:equatable/equatable.dart';

class Alarm extends Equatable {
  const Alarm({required this.id, required this.receiver, required this.body});

  final int id;
  final String receiver;
  final String body;

  @override
  List<Object> get props => [id, receiver, body];
}
