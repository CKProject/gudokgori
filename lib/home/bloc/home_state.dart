part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure, listFailure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.homes = const Home(
        totalPrice: 0,
        payedPrice: 0,
        approachingServices: <ApproachingService>[]),
    this.services = const <ServiceSub>[],
    this.hasReachedMax = false,
  });

  final HomeStatus status;
  final Home homes;
  final List<ServiceSub> services;
  final bool hasReachedMax;

  HomeState copyWith({
    HomeStatus? status,
    Home? homes,
    List<ServiceSub>? services,
    bool? hasReachedMax,
  }) {
    return HomeState(
      status: status ?? this.status,
      homes: homes ?? this.homes,
      services: services ?? this.services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''HomeState { status: $status, Homes: $homes, Services: ${services.length}, hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, homes, services, hasReachedMax];
}
