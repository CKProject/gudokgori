import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudokgori/home/view/home_page.dart';

import 'bloc_observer.dart';
import 'login/view/input_name_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(() => runApp(MyApp()), blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GudokGori',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Noto',
            ),
            home: const InputNamePage(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
