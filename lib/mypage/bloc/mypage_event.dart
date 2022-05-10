part of 'mypage_bloc.dart';

abstract class MyPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MyPageFetched extends MyPageEvent {}
