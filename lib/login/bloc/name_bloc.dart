import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameInitial()) {
    on<NameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
