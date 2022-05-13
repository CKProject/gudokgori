import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gudokgori/home/home.dart';
import 'package:gudokgori/service_sub/view/sub_detail_page.dart';
import 'package:intl/intl.dart';

class SubscribeBox extends StatefulWidget {
  const SubscribeBox({Key? key, required this.homeService}) : super(key: key);

  final HomeService homeService;
  @override
  _SubscribeBoxState createState() => _SubscribeBoxState();
}

class _SubscribeBoxState extends State<SubscribeBox> {
  String subImg = "";
  late HomeService homeService;
  @override
  void initState() {
    homeService = widget.homeService;
    storeImage(homeService.serviceImg);
    super.initState();
  }

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
                  subImg,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container();
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
                    Text(
                      DateFormat('yyyy.MM.dd').format(homeService.startDate) +
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

  void storeImage(String img) async {
    print("img : $img");
    var ref = FirebaseStorage.instance.ref().child('유튜브프리미엄.jpg');
    try {
      String s = await ref.getDownloadURL();
      print("s : $s");
      setState(() {
        subImg = s;
      });
    } catch (_) {
      print(_);
    }
  }
}
