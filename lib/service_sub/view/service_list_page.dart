import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/service_sub/bloc/service_list_bloc.dart';

import 'service_list_view.dart';

class ServiceListPage extends StatelessWidget {
  const ServiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceListBloc>(
      create: (context) => ServiceListBloc()..add(ServiceListFetched()),
      child: const ServiceListView(),
    );
  }
}
