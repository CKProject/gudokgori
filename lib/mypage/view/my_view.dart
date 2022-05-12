import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/mypage_bloc.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 7),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<MyPageBloc, MyPageState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 40, bottom: 40),
                  child: Text("프로필을 변경해 보세요.",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Noto',
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/profile.png',width:50),
                          Positioned(
                              left:33,
                              top:33,
                              child: Image.asset('assets/edit_2.png', width:17))
                        ],
                      ),
                      SizedBox(width:20),
                      Text('라율희',
                        style:TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width:2,
                      color:Color(0xFFF8FAFF),
                    )
                  ),
                ),
                SizedBox(height:30),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('전화번호',
                        style:TextStyle(
                          fontSize:13,
                          color:Color(0xFF666666),
                        ),
                      ),
                      Text('010-4654-7855',
                        style:TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:30),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('총 구독 수 ',
                        style:TextStyle(
                          fontSize:13,
                          color:Color(0xFF666666),
                        ),
                      ),
                      Text('12 개',
                        style:TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:30),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('한달 구독 비용',
                        style:TextStyle(
                          fontSize:13,
                          color:Color(0xFF666666),
                        ),
                      ),
                      Text('182,000 원',
                        style:TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:30),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width:2,
                        color:Color(0xFFF8FAFF),
                      )
                  ),
                ),

                SizedBox(height:30),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Row(
                    children: [
                      Text('로그아웃',
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width:5),
                      Icon(Icons.arrow_forward_ios, size:15),
                    ],
                  ),
                ),
                
                SizedBox(height:15),
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Row(
                    children: [
                      Text('회원탈퇴',
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width:5),
                      Icon(Icons.arrow_forward_ios, size:15),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
