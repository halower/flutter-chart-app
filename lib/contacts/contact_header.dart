import 'package:flutter/material.dart';
import './contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ContactItem(isHeader: true, titleName:'关内通知',imageName:'images/icon_public.png'),
      ContactItem(isHeader: true, titleName:'常用联系人',imageName:'images/icon_groupchat.png'),
    ],);
  }
}