import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teacher/home_main.dart';
import 'package:teacher/screens/login_screen.dart';
import 'package:teacher/screens/login_screen.dart';
import 'package:teacher/screens/Score.dart';
import 'package:teacher/ui/theme/app_color.dart';
import 'package:teacher/ui/views/home_view.dart';

Future<void> main()  async {
 await dotenv.load();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,

        theme: ThemeData(
        // canvasColor: AppColor.black,
        fontFamily: "Inter",
        ),
      // home: HomeView(),
      home: home_main(),

    );
  }
}
