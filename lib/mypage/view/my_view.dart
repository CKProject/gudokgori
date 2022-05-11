import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/mypage_bloc.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MyPageBloc, MyPageState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(state.profile.name),
              ],
            );
          },
        ),
      ),
    );
  }
}
