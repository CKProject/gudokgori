import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../models/alarm.dart';

class AlarmBox extends StatelessWidget {
  const AlarmBox({Key? key, required this.alarm}) : super(key: key);

  final Alarm alarm;

  @override
  Widget build(BuildContext context) {
    ///TODO:알람 박스
    return Row(
      children: [
        Text(alarm.body),
        Text(Jiffy(
                "${alarm.createAt.year}-${alarm.createAt.month}-${alarm.createAt.day}",
                "yyyy-MM-dd")
            .fromNow()),
      ],
    );
  }
}
