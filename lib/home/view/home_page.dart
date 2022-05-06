import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/home/view/home_view.dart';
import 'package:http/http.dart' as http;

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(httpClient: http.Client())..add(HomeInit()),
      child: const HomeView(),
    );
  }
}
