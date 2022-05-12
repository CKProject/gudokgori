import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/service_sub/bloc/service_list_bloc.dart';

import '../widgets/service_box.dart';

class ServiceListView extends StatelessWidget {
  const ServiceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 7),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 40, bottom: 40),
            child: const Text("구독 서비스를 선택해 주세요.",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Noto',
                  fontWeight: FontWeight.w700,
                )),
          ),
          Expanded(
            child: BlocBuilder<ServiceListBloc, ServiceListState>(
              builder: (context, state) {
                switch (state.status) {
                  case ServiceListStatus.failure:
                    return const Center(
                        child: Text('failed to fetch ServiceLists'));
                  case ServiceListStatus.success:
                    if (state.serviceList.isEmpty) {
                      return const Center(child: Text('no alarms'));
                    }
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ServiceBox(
                              serviceList: state.serviceList[index]);
                        },
                        itemCount: state.serviceList.length);
                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
