import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SpentMoneyBox extends StatelessWidget {
  const SpentMoneyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
          color: Color(0xFFF8FAFF), borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 15,
            ),
            height: 100,
            child: CircularPercentIndicator(
              radius: 37.0,
              lineWidth: 7.0,
              animation: true,
              percent: 0.4,
              center: Text(
                "5월",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Color(0xFF364EF6),
            ),
          ),
          SizedBox(width: 25),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('결제된 금액',
                    style: TextStyle(
                      color: Color(0xFF364EF6),
                    )),
                Text('162,000원',
                    style: TextStyle(
                        color: Color(0xFF364EF6),
                        fontSize: 20,
                        fontFamily: 'Noto',
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          SizedBox(width: 25),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('총 결제 금액', style: TextStyle()),
                Text('182,000원',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Noto',
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
