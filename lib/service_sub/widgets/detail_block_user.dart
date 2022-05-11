import 'package:flutter/material.dart';

class DetailBlcokUser extends StatefulWidget {
  const DetailBlcokUser({Key? key}) : super(key: key);

  @override
  _DetailBlcokUserState createState() => _DetailBlcokUserState();
}

class _DetailBlcokUserState extends State<DetailBlcokUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          color: Color(0xFFF8FAFF), borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset('assets/nemo_user.png', width: 60),
          ),
          SizedBox(width: 15),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('카테고리',
                    style: TextStyle(
                      fontSize: 11,
                    )),
                Row(
                  children: [
                    Text('직접입력',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Noto',
                            fontWeight: FontWeight.w700)),
                    SizedBox(width: 7),
                    Image.asset('assets/edit.png', width: 19),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
