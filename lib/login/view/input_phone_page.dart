import 'package:flutter/material.dart';
import 'package:gudokgori/home/home.dart';
import 'package:gudokgori/home/view/home_view.dart';

class InputPhonePage extends StatelessWidget {
  const InputPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 100, bottom: 20),
            child: const Text("인증번호를 입력해 주세요.",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Noto',
                  fontWeight: FontWeight.w700,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top:40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '인증번호',
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                const TextField(),

                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('2:20',
                      style:TextStyle(
                        color:Color(0xFFFF1B1B),
                      )
                    ),
                    SizedBox(width:10),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width:60,
                        height:22,
                        decoration: BoxDecoration(
                          color:Color(0xFF6F7AFF),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text('재전송',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:12,
                            )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 348),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFF364EF6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        '다음',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
