import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/mypage/view/my_view.dart';

import '../bloc/mypage_bloc.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MypageBloc>(
      create: (context) => MypageBloc(),
      child: const MyView(),
    );
  }
}
