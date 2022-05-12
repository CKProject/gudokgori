import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../models/alarm.dart';

class AlarmBox extends StatelessWidget {
  const AlarmBox({Key? key, required this.alarm}) : super(key: key);

  final Alarm alarm;

  @override
  Widget build(BuildContext context) {
    ///TODO:알람 박스
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left:10, right:10),
          width:MediaQuery.of(context).size.width,
          height:100,
          decoration: BoxDecoration(
            color:Color(0xFFF8FAFF)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('결제 예정일 알림',
                    style:TextStyle(
                      fontSize: 10,
                      color:Color(0xFF7e7e7e)
                    )
                  ),
                  Text(alarm.body,
                    style:TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ],
              ),
              Text(Jiffy(
                  "${alarm.createAt.year}-${alarm.createAt.month}-${alarm.createAt.day}",
                  "yyyy-MM-dd")
                  .fromNow(),
              style: TextStyle(
                  color:Color(0xFF7e7e7e),
                fontSize:12,
              ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
