import 'package:flutter/material.dart';
import 'package:tbcontact/app.dart';
import 'package:tbcontact/contacts/contact_detail.dart';
import 'package:tbcontact/contacts/topcontact.dart';
import 'package:tbcontact/login/Login.dart';
import 'package:tbcontact/search.dart';

Map<String, WidgetBuilder> routes = {
  "login":(BuildContext context) => new Login(),
  "app":(BuildContext context) => new App(),
  "search":(BuildContext context) => new Search(),
  "topcontact":(BuildContext context) => new TopContacts(),
  "contactdetail":(BuildContext context) => new ContactDetail(),
};

