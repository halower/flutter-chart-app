import 'package:flutter/material.dart';
import 'package:tbcontact/contacts/contact_detail.dart';
import 'package:tbcontact/contacts/contact_vo.dart';
import 'package:tbcontact/conversations/message.dart';
import '../common/touch_callback.dart';
class ContactItem extends StatelessWidget {
  final ContactVO item;
  final String titleName;
  final String imageName;
  final bool  isHeader;
  final bool fromTopContact;
  ContactItem({this.item, this.isHeader = false, this.titleName, this.imageName, this.fromTopContact= false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      child: TouchCallBack(
        onPressed: () {
          if (isHeader) 
             Navigator.pushNamed(context, 'topcontact');
           else
           Navigator.of(context).push(new MaterialPageRoute(builder: (_) {return new ContactDetail(contactVo: item, fromTopContact: fromTopContact);}));
        },
        onDoublePressed: () async { 
          if (isHeader) return;
          Navigator.of(context).push(new MaterialPageRoute(builder: (_)
          {return new Message(username: item.mobilePhone, nickName: item.userName, avatarUrl: item.avatarUrl);}));
        },
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Container(
              margin: const EdgeInsets.only(left: 13.0, right: 13.0),
              child: isHeader?Image.asset(imageName,width: 48.0, height: 48.0,scale: 0.9,)
              :Image.network(item.avatarUrl,width: 48.0, height: 48.0,scale: 0.9,),
            ),
          isHeader?
          Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? item.userName ?? '--':titleName,
                style: TextStyle(fontSize: 18.0,color: Color(0xFF353535)),
                maxLines: 1,
             )
            ,):
            Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                  Text(
                    item.userName,
                    style: TextStyle(fontSize: 16.0,color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                  ),
                  Text(
                    item.department + ((item.subDepartment!="" && item.subDepartment!=null)? '-' + item.subDepartment : ''),
                    style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
               ],
             ),
            ),
          ],
        ),
      ),
      );
  }
}