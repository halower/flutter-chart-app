import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tbcontact/common/appconst.dart';
import 'package:tbcontact/common/application.dart';
import 'package:tbcontact/conversations/conversation_vo.dart';
import 'package:tbcontact/conversations/converstation_item.dart';

class ConverstationPage extends StatefulWidget{
  @override
  ConverstationPageState createState() => new ConverstationPageState();
}

class ConverstationPageState extends State<ConverstationPage>{
    final List<ConverstationVO> _localConverstations = <ConverstationVO>[];
  @override
  void initState() {
    super.initState();
    loadConversations();
  }

  loadConversations() async {
    var res = await Dio().get("${AppConst.converstationUrl}?LoginUser=${Application.loginUserName}");
    for(var con in res.data) {
     var conObj = ConverstationVO.fromJson(con);
     setState(() {
        _localConverstations.add(conObj); 
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _localConverstations.length,
          itemBuilder: (BuildContext context, int index){
            return new ConversationItem(_localConverstations[index]);
          }
      ),
    );
  }
}