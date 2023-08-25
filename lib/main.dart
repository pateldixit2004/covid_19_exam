import 'package:covid_19_api_exam/screen/view/home_screen.dart';
import 'package:covid_19_api_exam/screen/view/serch_screen.dart';
import 'package:covid_19_api_exam/screen/view/view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => HomeScreen(),
        '/serch':(p0) => SerchScreen(),
        '/dataview':(p0) => DataViewScreen(),
      },
    )
  );
}