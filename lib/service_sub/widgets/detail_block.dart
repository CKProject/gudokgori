import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailBlock extends StatefulWidget {
  const DetailBlock({Key? key}) : super(key: key);

  @override
  _DetailBlockState createState() => _DetailBlockState();
}

class _DetailBlockState extends State<DetailBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:Get.width,
      height:100,
      decoration: BoxDecoration(
          color:Color(0xFFF8FAFF),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Container(
            padding:EdgeInsets.only(left:10),
            child: Image.asset('assets/nemo_netflix.png', width:60),
          ),
          SizedBox(width:15),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OTT',
                    style:TextStyle(
                      fontSize:11,
                    )
                ),
                Text('넷플릭스',
                    style:TextStyle(
                        fontSize:20,
                        fontFamily: 'Noto',
                        fontWeight: FontWeight.w700
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
