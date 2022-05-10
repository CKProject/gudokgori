part of 'mypage_bloc.dart';

enum MyPageStatus { initial, success, failure }

class MyPageState extends Equatable {
  const MyPageState(
      {this.status = MyPageStatus.initial,
      this.profile = const Profile(
          id: 0,
          name: 'name',
          phone: '01012345678',
          profileImg: 'profileImg',
          serviceCount: 0,
          totalPrice: 0)});

  final MyPageStatus status;
  final Profile profile;

  MyPageState copyWith({
    MyPageStatus? status,
    Profile? profile,
  }) {
    return MyPageState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
    );
  }

  @override
  String toString() {
    return '''MyPageState { status: $status, MyPages: $profile }''';
  }

  @override
  List<Object> get props => [status, profile];
}
