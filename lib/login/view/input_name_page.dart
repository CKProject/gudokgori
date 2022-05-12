import 'package:flutter/material.dart';

import 'input_phone_page.dart';

class InputNamePage extends StatelessWidget {
  const InputNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 100, bottom: 20),
            child: const Text("전화번호를 입력해 주세요.",
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
                  '전화번호',
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                const TextField(),

                SizedBox(height:40),
                const Text(
                  '이름',
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                const TextField(),

                const SizedBox(height: 270),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return InputPhonePage();
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
