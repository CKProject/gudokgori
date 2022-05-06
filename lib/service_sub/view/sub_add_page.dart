import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/service_sub/view/sub_add_view.dart';

import '../bloc/service_sub_bloc.dart';

class SubAddPage extends StatelessWidget {
  const SubAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceSubBloc>(
      create: (context) => ServiceSubBloc(),
      child: const SubAddView(),
    );
  }
}
