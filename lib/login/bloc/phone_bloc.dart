import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  PhoneBloc() : super(PhoneInitial()) {
    on<PhoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
