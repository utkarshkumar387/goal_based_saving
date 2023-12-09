import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/homepage/connectors/homepage_view_connector.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:fello_hackathon/redux/store.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomepageViewConnector(),
          );
        },
      ),
    );
  }
}
