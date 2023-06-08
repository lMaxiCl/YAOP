import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_with_details_test/router.dart';
import 'package:network/network_service.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    GetIt.instance.registerSingleton<NetworkService>(
      NetworkService(),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Star Wars App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router(),
    );
  }
}
