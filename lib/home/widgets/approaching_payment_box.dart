import 'package:flutter/material.dart';
import 'package:gudokgori/home/home.dart';
import 'package:gudokgori/home/widgets/approaching_service_widget.dart';

class ApproachingPaymentBox extends StatelessWidget {
  const ApproachingPaymentBox({Key? key, required this.services})
      : super(key: key);

  final List<ApproachingService> services;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: BoxDecoration(
          color: const Color(0xFFF8FAFF),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '결제일 다가오는 서비스',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Noto',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: services.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ApproachingServiceWidget(
                        service: services[index],
                      );
                    })
                : const Text("없음"),
          )
        ],
      ),
    );
  }
}
