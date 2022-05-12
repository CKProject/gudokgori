import 'package:flutter/material.dart';

class DetailBlockUser extends StatefulWidget {
  const DetailBlockUser({Key? key}) : super(key: key);

  @override
  _DetailBlockUserState createState() => _DetailBlockUserState();
}

class _DetailBlockUserState extends State<DetailBlockUser> {
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
            child: Image.asset('assets/nemo_user.png', width: 60),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('카테고리',
                  style: TextStyle(
                    fontSize: 11,
                  )),
              Row(
                children: [
                  const Text('직접입력',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Noto',
                          fontWeight: FontWeight.w700)),
                  const SizedBox(width: 7),
                  Image.asset('assets/edit.png', width: 19),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
