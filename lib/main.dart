import 'package:flutter/material.dart';
import 'package:tbcontact/guide.dart';
import 'package:tbcontact/routes.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner:false,
  title:'tbchat',
  theme: mDefaultTheme,
  routes:routes,
  home: new GuidePage(),
));


final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f),
);