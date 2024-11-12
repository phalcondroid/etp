import 'dart:async';

import 'package:etp/auth/login_page.dart';
import 'package:etp/base/ui/themes/theme.dart';
import 'package:etp/base/ui/themes/util.dart';
import 'package:etp/constants/constants.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
        navigatorKey: Constants.globalNavigatorKey,
        title: 'ETP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: null,
          body: Builder(builder: (context) {
            Timer(
              const Duration(milliseconds: 3500),
              () async {
                Navigator.pushAndRemoveUntil<LoginPage>(
                  context,
                  MaterialPageRoute<LoginPage>(
                    builder: (_) => const LoginPage(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            );
            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                      child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          flex: 2,
                          child: Image.asset(
                            "assets/images/ambulance.png",
                          )),
                      const Spacer()
                    ],
                  )),
                  const Spacer()
                ],
              ),
            );
          }),
        ));
  }
}
