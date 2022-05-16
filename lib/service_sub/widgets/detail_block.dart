import 'package:flutter/material.dart';

class DetailBlock extends StatelessWidget {
  const DetailBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          color: const Color(0xFFF8FAFF),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/nemo_netflix.png', width: 60),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('OTT',
                  style: TextStyle(
                    fontSize: 11,
                  )),
              Text('넷플릭스',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Noto',
                      fontWeight: FontWeight.w700))
            ],
          ),
        ],
      ),
    );
  }
}
