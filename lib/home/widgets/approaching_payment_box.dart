import 'package:flutter/material.dart';

class ApproachingPaymentBox extends StatelessWidget {
  const ApproachingPaymentBox({Key? key}) : super(key: key);

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
          Row(
            children: [
              Column(
                children: [
                  Image.asset('assets/disney.png', width: 50),
                  const Text(
                    '1일 뒤',
                    style: TextStyle(
                      color: Color(0xFFFF1B1B),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Image.asset('assets/netflix.png', width: 50),
                  const Text(
                    '3일 뒤',
                    style: TextStyle(
                      color: Color(0xFFFF1B1B),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Image.asset('assets/tving.png', width: 50),
                  const Text(
                    '7일 뒤',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Image.asset('assets/youtube.png', width: 50),
                  const Text(
                    '15일 뒤',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
