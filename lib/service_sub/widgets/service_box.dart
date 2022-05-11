import 'package:flutter/material.dart';
import 'package:gudokgori/service_sub/models/service_list.dart';
import 'package:gudokgori/service_sub/view/sub_add_page.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({Key? key, required this.serviceList}) : super(key: key);

  final ServiceList serviceList;

  @override
  Widget build(BuildContext context) {
    ///TODO:서비스 박스
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubAddPage(serviceList: serviceList)),
        );
      },
      child: Container(
        height: 50,
        color: Colors.grey.shade100,
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(serviceList.serviceName),
            Text(serviceList.serviceCategory),
          ],
        ),
      ),
    );
  }
}
