import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:tbcontact/conversations/conversation_vo.dart';
import 'package:tbcontact/conversations/message.dart';
import '../common/touch_callback.dart';


class ConversationItem extends StatelessWidget {
  final ConverstationVO converstation;
  ConversationItem(this.converstation);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      child: TouchCallBack(
        onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (_)
          {return new Message(username: converstation.sessionId, nickName: converstation.nickName, avatarUrl: converstation.avatarUrl);}));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 13.0, right: 13.0),
              child: Image.network(converstation.avatarUrl, width: 48.0, height: 48.0,),
            ),
            Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                  Text(
                    converstation.nickName,
                    style: TextStyle(fontSize: 16.0,color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                  ),
                  Text(
                    converstation.text,
                    style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
               ],
             ),
            ),
             Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12.0,top: 12.0),
              child: Text(
                TimelineUtil.formatByDateTime(converstation.time.add(Duration(hours: 8)), locale: 'zh', dayFormat:DayFormat.Simple),
                style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
              ),
            ),
          ],
        ),
    )
    ,);
  }
}