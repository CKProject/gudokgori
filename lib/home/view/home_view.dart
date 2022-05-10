import 'package:flutter/material.dart';
import 'package:gudokgori/alarm/view/alarm_page.dart';

import '../../service_sub/view/service_list_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(top: 11.0, bottom: 11),
          child: CircleAvatar(),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ServiceListPage()),
              );
            },
            child: const CircleAvatar(
              radius: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlarmPage()),
                );
              },
              child: const CircleAvatar(
                radius: 17,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [],
      ),
    );
  }
}
