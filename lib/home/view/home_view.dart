import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/alarm/view/alarm_page.dart';
import 'package:gudokgori/mypage/view/my_page.dart';
import 'package:intl/intl.dart';

import '../../service_sub/view/service_list_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/approaching_payment_box.dart';
import '../widgets/spent_money_box.dart';
import '../widgets/subscribe_box.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final f = NumberFormat('###,###,###,###');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 0, left: 10),
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyPage()),
                );
              },
              child: Image.asset('assets/profile.png')),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset('assets/plus_2.png', width: 30, height: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10, top: 5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlarmPage()),
                );
              },
              child: Image.asset('assets/arlim.png', width: 30, height: 30),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 40, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('이번달 결제 예정 금액',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Noto',
                    fontWeight: FontWeight.w700,
                  )),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Text(
                    state.status == HomeStatus.initial
                        ? "..."
                        : f.format(state.homes.totalPrice) + "원",
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Noto',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF364EF6),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return SpentMoneyBox(
                    total: state.status == HomeStatus.initial
                        ? "..."
                        : f.format(state.homes.totalPrice) + "원",
                    payed: state.status == HomeStatus.initial
                        ? "..."
                        : f.format(state.homes.payedPrice) + "원",
                    percent: state.homes.payedPrice / state.homes.totalPrice,
                  );
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ApproachingPaymentBox(
                    services: state.homes.approachingServices,
                  );
                },
              ),
              const SizedBox(height: 40),
              const Text(
                '내 구독 서비스',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.services.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (state.status == HomeStatus.initial) {
                        return const Text("로딩중");
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SubscribeBox(
                            homeService: state.services[index],
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
