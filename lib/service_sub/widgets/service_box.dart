import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gudokgori/service_sub/models/service_list.dart';
import 'package:gudokgori/service_sub/view/sub_add_page.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({Key? key, required this.serviceList}) : super(key: key);

  final ServiceList serviceList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubAddPage(serviceList: serviceList)),
        );
      },
      child: Container(
        height: 80,
        color: Color(0xFFF8FAFF),
        margin: const EdgeInsets.only(bottom: 5),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Image.asset('assets/nemo_netflix.png', width: 60),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(serviceList.serviceCategory,
                      style: TextStyle(fontSize: 10, color: Color(0xFF7B7B7B))),
                  Text(
                    serviceList.serviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
