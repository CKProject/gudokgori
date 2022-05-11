import 'package:flutter/material.dart';
import 'package:gudokgori/service_sub/models/service_list.dart';

class SubAddView extends StatelessWidget {
  const SubAddView({Key? key, required this.serviceList}) : super(key: key);

  final ServiceList serviceList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(serviceList.serviceName),
    );
  }
}
