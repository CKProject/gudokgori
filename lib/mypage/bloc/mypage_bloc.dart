import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mypage_event.dart';
part 'mypage_state.dart';

class MypageBloc extends Bloc<MypageEvent, MypageState> {
  MypageBloc() : super(MypageInitial()) {
    on<MypageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
