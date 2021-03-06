import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/alarm/view/alarm_view.dart';

import '../bloc/alarm_bloc.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlarmBloc>(
      create: (context) => AlarmBloc()..add(AlarmFetched()),
      child: const AlarmView(),
    );
  }
}
