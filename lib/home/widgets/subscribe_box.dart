import 'package:flutter/material.dart';
import 'package:gudokgori/service_sub/models/models.dart';
import 'package:gudokgori/service_sub/view/sub_detail_page.dart';
import 'package:intl/intl.dart';

class SubscribeBox extends StatelessWidget {
  const SubscribeBox({Key? key, required this.homeService}) : super(key: key);
  final ServiceSub homeService;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubDetailPage(
                    service: homeService,
                  )),
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
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/gudokgori.appspot.com/o/${homeService.serviceImg}?alt=media&token${homeService.token}',
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    print(
                        'https://firebasestorage.googleapis.com/v0/b/gudokgori.appspot.com/o/${homeService.serviceImg}?alt=media&token${homeService.token}');
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          homeService.serviceName,
                          style: const TextStyle(
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
                          child: Center(
                            child: Text(
                              '${homeService.remainDate}일 뒤',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('yyyy.MM.dd')
                              .format(homeService.startSubscribe) +
                          ' ~',
                      style: const TextStyle(
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
