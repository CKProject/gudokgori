import 'package:flutter/material.dart';
import 'package:gudokgori/home/home.dart';

class ApproachingServiceWidget extends StatelessWidget {
  const ApproachingServiceWidget({Key? key, required this.service})
      : super(key: key);

  final ApproachingService service;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Image.network(
              'https://firebasestorage.googleapis.com/v0/b/gudokgori.appspot.com/o/${service.serviceName}?alt=media&token=0dcb5481-33ee-42d6-a793-d850e74ce751',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
            return const CircularProgressIndicator();
          }, width: 50),
          Text(
            '${service.remainDate}일 뒤',
            style: TextStyle(
              color: service.remainDate < 4
                  ? const Color(0xFFFF1B1B)
                  : Colors.black, //3일이내
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
