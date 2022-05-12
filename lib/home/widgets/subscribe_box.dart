import 'package:flutter/material.dart';
import 'package:gudokgori/service_sub/view/sub_detail_page.dart';

class SubscribeBox extends StatelessWidget {
  const SubscribeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SubDetailPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xFFF8FAFF),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/youtube.png'),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '유튜브 프리미엄',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFF6F7AFF), //Color(0xFFFF6464) red color
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              '15일 뒤',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '2021.07.15 ~',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Align(
                alignment: Alignment.center,
                child: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }
}
