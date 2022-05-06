import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'service_sub_event.dart';
part 'service_sub_state.dart';

class ServiceSubBloc extends Bloc<ServiceSubEvent, ServiceSubState> {
  ServiceSubBloc() : super(ServiceSubInitial()) {
    on<ServiceSubEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
