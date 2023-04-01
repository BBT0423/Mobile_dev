import 'package:flutter/material.dart';
import 'package:flutter_application_7/launcher.dart';
import 'package:flutter_application_7/provider.dart';
import 'package:flutter_application_7/provider_for_account.dart';
import 'package:provider/provider.dart';

void main() {
  var app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((_) {
        return test_provider();
      })),
      ChangeNotifierProvider(
        create: (context) {
          return provider_account();
        },
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
  runApp(app);
}

// ส่วนของ Stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.purple,
        ),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.red)),
      ),
      title: 'First Flutter App',
      initialRoute: '/', // สามารถใช้ home แทนได้
      routes: {
        Launcher.routeName: (context) => Launcher(),
      },
    );
  }
}
