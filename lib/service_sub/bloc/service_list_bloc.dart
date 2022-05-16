import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gudokgori/service_sub/models/service_list.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/service_sub.dart';

part 'service_list_event.dart';
part 'service_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ServiceListBloc extends Bloc<ServiceListEvent, ServiceListState> {
  ServiceListBloc() : super(const ServiceListState()) {
    on<ServiceListFetched>(
      _onServiceListFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onServiceListFetched(
      ServiceListFetched event, Emitter<ServiceListState> emit) async {
    try {
      final serviceList = await _fetchServiceLists();
      serviceList.insert(
          0,
          const ServiceList(
              id: 0,
              serviceName: '직접입력',
              serviceImg: 'serviceImg',
              serviceCategory: ''));
      emit(state.copyWith(
        status: ServiceListStatus.success,
        serviceList: serviceList,
      ));
    } catch (_) {
      print(_);
      emit(state.copyWith(status: ServiceListStatus.failure));
    }
  }

  Future<List<ServiceList>> _fetchServiceLists() async {
    try {
      var serviceList = await FirebaseFirestore.instance
          .collection('subscribeList')
          .orderBy('serviceCategory')
          .get();
      return serviceList.docs.map((doc) {
        return ServiceList(
            id: doc['id'],
            serviceName: doc['serviceName'],
            serviceImg: doc['serviceImg'],
            serviceCategory: doc['serviceCategory']);
      }).toList();
    } catch (_) {
      print(_);
      throw Exception('error fetching Alarms : $_');
    }
  }

  ServiceSub serviceListToSub(ServiceList serviceList, String userPhone) {
    return ServiceSub(
      userPhone: userPhone,
      serviceName: serviceList.serviceName,
      serviceImg: serviceList.serviceImg,
      serviceCategory: serviceList.serviceCategory,
      simpleMemo: "",
      subscribePrice: 0,
      startSubscribe: DateTime.now(),
      payPeriod: 0,
      payPeriodUnit: "D",
      hasFreePeriod: false,
      freePeriod: 0,
      freePeriodUnit: "D",
      remainDate: 0,
      nextPeriod: DateTime.now(),
      token: "",
    );
  }
}
