import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:tbcontact/common/application.dart';
import 'package:tbcontact/common/touch_callback.dart';
import 'package:tbcontact/conversations/conversation_vo.dart';
import 'package:tbcontact/conversations/message_item.dart';
import 'package:tbcontact/conversations/message_vo.dart';
import '../common/appconst.dart';
class Message extends StatefulWidget {
  final String nickName;
  final String username;
  final String avatarUrl;
  const Message({Key key, this.nickName, this.username, this.avatarUrl}) : super(key:
key);
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    super.initState();
    loadCurrentSessionData();
    addListener();
  }

  void addListener() async {
    JmessageFlutter jmessage =new JmessageFlutter();
    jmessage.addReceiveMessageListener((msg) async {
      var dio = new Dio();
      var res = await dio.get('${AppConst.converstationUrl}?LoginUser=${Application.loginUserName}&SessionId=${widget.username}');
      // 查看是否已经存在会话,就创建消息
      if(res.data.length==0) {
        ConverstationVO conversation = new ConverstationVO(
            loginUser: Application.loginUserName,
            nickName: widget.nickName,
            sessionId: widget.username,
            avatarUrl:  widget.avatarUrl.isEmpty? AppConst.defaultAvatar:widget.avatarUrl,
            text: msg.text,
            time: DateTime.now()
          );
         await dio.post(AppConst.converstationUrl,data: conversation.toJson());
      }
      MessageVO message = new MessageVO(
      loginUser: Application.loginUserName,
      sessionId: widget.username,
      sender:  widget.username,
      avatarUrl:  widget.avatarUrl.isEmpty? AppConst.defaultAvatar:widget.avatarUrl,
      nickName: widget.nickName,
      text: msg.text,
      time: DateTime.now()
    );
    await dio.post(AppConst.messageUrl,data: message.toJson());
    var messageItem = new MessageItem(conversation: message,);
    //更新会话
    var cons = ConverstationVO.fromJson(res.data[0]);
    await dio.put('${AppConst.converstationUrl}/${cons.id}', data: {
       'Text': msg.text,
       'Time': DateTime.now().toIso8601String()
     });
     setState(() {
        _messageItems.insert(0, messageItem);
     }); 
    });
  }

  final TextEditingController _chatController = new TextEditingController();
  final List<MessageItem> _messageItems = <MessageItem>[];

  loadCurrentSessionData() async {
    //网络请求
    Dio dio = new Dio();
    var res = await dio.get('${AppConst.messageUrl}?LoginUser=${Application.loginUserName}&SessionId=${widget.username}&_limit=60');
    for(var item in res.data) {
      var conversation = MessageVO.fromJson(item);
      if(conversation.avatarUrl.isEmpty) {
        conversation.avatarUrl = AppConst.defaultAvatar;
      }
      var messageItem = new MessageItem(conversation: conversation,);
      setState(() {
        _messageItems.insert(0, messageItem);
      });
    }
  }
  
  // 发送消息
  Future _handleSubmit(String text) async {
    _chatController.clear();
   final JMSingle targetType = JMSingle.fromJson({
    'username': widget.username,
    'nickname': widget.nickName,
    'appKey': Application.kAppkey
   });
  
 var res = await Dio().get('${AppConst.converstationUrl}?LoginUser=${Application.loginUserName}&SessionId=${widget.username}');
 // 查看是否已经存在会话,就创建消息
 if(res.data.length == 0) {
     ConverstationVO conversation = new ConverstationVO(
     loginUser: Application.loginUserName,
     nickName: widget.nickName,
     sessionId: widget.username,
     avatarUrl:  widget.avatarUrl.isEmpty? AppConst.defaultAvatar:widget.avatarUrl,
     text: text,
     time: DateTime.now() 
   );
    await Dio().post(AppConst.converstationUrl,data: conversation.toJson());
  }
    //存储当前消息
    MessageVO message = new MessageVO(
      loginUser: Application.loginUserName,
      sessionId: widget.username,
      sender:  Application.loginUserName,
      avatarUrl: Application.loginUserAvatarUrl.isEmpty? AppConst.defaultAvatar: Application.loginUserAvatarUrl,
      nickName: Application.loginUserNickName,
      text: text,
      time: DateTime.now()
    );
  await Dio().post(AppConst.messageUrl,data: message.toJson());
  var url ='${AppConst.converstationUrl}?LoginUser=${widget.username}&SessionId=${Application.loginUserName}';
  var anotherRes = await Dio().get(url);
  if(anotherRes.data.length==0) {
    //存储对方会话
      ConverstationVO conversation = new ConverstationVO(
       loginUser: widget.username,
       nickName: Application.loginUserNickName,
       sessionId: Application.loginUserName,
       avatarUrl:  widget.avatarUrl.isEmpty? AppConst.defaultAvatar:widget.avatarUrl,
       text: text,
       time: DateTime.now()
     );
    await Dio().post(AppConst.converstationUrl,data: conversation.toJson());
  }
   //存储对方消息
   MessageVO anotherMessage = new MessageVO(
       loginUser: widget.username,
       sessionId: Application.loginUserName,
       sender:  Application.loginUserName,
       avatarUrl: Application.loginUserAvatarUrl.isEmpty? AppConst.defaultAvatar: Application.loginUserAvatarUrl,
       nickName: Application.loginUserNickName,
       text: text,
       time: DateTime.now()
  );
   await Dio().post(AppConst.messageUrl,data: anotherMessage.toJson());

  bool canUpdate = res.data.length!=0 && anotherRes.data.length!=0;
  if(canUpdate) {
   var cons = ConverstationVO.fromJson(res.data[0]);
   //更新当前会话
   await Dio().put('${AppConst.converstationUrl}/${cons.id}', data: {
       'Text': text,
       'Time': DateTime.now().toIso8601String()
   });
  var anotherCons = ConverstationVO.fromJson(anotherRes.data[0]);
    //更新对方会话
   await Dio().put('${AppConst.converstationUrl}/${anotherCons.id}', data: {
       'Text': text,
       'Time': DateTime.now().toIso8601String()
   });
 }
 var messageItem = new MessageItem(conversation: message,);
     setState(() {
        _messageItems.insert(0, messageItem);
 });
 if(Application.enableIM) {
      JmessageFlutter jMessage = new JmessageFlutter();
   jMessage.sendTextMessage(type: targetType, text: text);
 }
}

  Widget _chatEnvironment() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              decoration: InputDecoration(
                  fillColor: Colors.black26,
                  filled: true,
                  hintText: '请输入...',
                  hintStyle: TextStyle(color: Colors.white)),
              controller: _chatController,
              onSubmitted: _handleSubmit,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () => _handleSubmit(_chatController.text),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TouchCallBack(
          isfeed: false,
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: 45.0,
            margin: const EdgeInsets.only(left: 12.0, right: 10.0),
            child: Icon(
              Icons.chevron_left,
              color: Colors.grey[500],
            ),
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        title: Text(widget.nickName),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messageItems[index],
              itemCount: _messageItems.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _chatEnvironment(),
          )
        ],
      ),
    );
  }
}
