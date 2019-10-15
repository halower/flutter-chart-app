import 'package:flutter/material.dart';
import 'package:tbcontact/common/application.dart';
import 'package:tbcontact/conversations/message_vo.dart';


class MessageItem extends StatelessWidget {
  final MessageVO conversation;

  const MessageItem({Key key, this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: conversation.sender == Application.loginUserName ? new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Image.network(conversation.avatarUrl,
                    width: 50.0,
                    height: 50.0,
                    scale: 0.9,
                  ),
          ),
          new Expanded(
            child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(conversation.nickName, style: TextStyle(fontSize: 12.0,
                  color: Colors
                  .grey)),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(conversation.text,
                 style: TextStyle(fontSize: 16.0, color: Colors.black87),
                ),
              )
            ],
          ),
          )
        ],
      ): new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
           new Expanded(
            child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Text(conversation.nickName, style: TextStyle(fontSize: 12.0,color: Colors.grey)),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(conversation.text
                 ,style: TextStyle(fontSize: 16.0, color: Colors.black87),
                ),
              )
            ],
          ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Image.network(conversation.avatarUrl,
                    width: 50.0,
                    height: 50.0,
                    scale: 0.9,
                  ),
          ),
        ],
      )
    );
  }
}