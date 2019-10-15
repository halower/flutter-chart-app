import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneSlider extends StatelessWidget {
  final Widget child;
  final String number;

  const PhoneSlider({Key key, this.number,  this.child}) : super(key: key);
  
  @override 
  Widget build(BuildContext context) {
  return (number == null || number.isEmpty ) ? child: Slidable(
  delegate: new SlidableDrawerDelegate(),
  actionExtentRatio: 0.25,
  child: child,

  secondaryActions: <Widget>[
    new IconSlideAction(
      caption: '发送短信',
      color: Colors.black45,
      icon: Icons.email,
      onTap: () async {
         var url = 'sms:' + number;
         await launch(url);
      },
    ),
    new IconSlideAction(
      caption: '拨打电话',
      color: Colors.blue,
      icon: Icons.phone,
      onTap:() async {
         var url = 'tel:' + number;
         await launch(url);
      },
    ),
  ]);
  }
}