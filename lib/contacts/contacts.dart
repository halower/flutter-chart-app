import 'package:azlistview/azlistview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:tbcontact/common/appconst.dart';
import 'package:tbcontact/contacts/contact_header.dart';
import 'package:tbcontact/contacts/contact_item.dart';
import 'package:tbcontact/contacts/contact_vo.dart';

class Contacts extends StatefulWidget {
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
    List<ContactVO> _contacts = List();
    int _suspensionHeight = 40;
    int _itemHeight = 60;
  
  void loadData() async {
    var dio = new Dio();
     var response = await dio.get("${AppConst.contactUrl}?_limit=600");
     for (var item in response.data) {
       var co= ContactVO.fromJson(item);
       if(co.avatarUrl.isEmpty) {
         co.avatarUrl=AppConst.defaultAvatar;
       }
       _contacts.add(co);
     }
     _handleList(_contacts);
     setState(() {});
  }

  @override
  void initState() { 
    super.initState();
    loadData();
  }

  void _handleList(List<ContactVO> contactData) {
    if (contactData == null || contactData.isEmpty) return;
    for (var item in contactData) {
      String pinyin = PinyinHelper.getPinyinE(item.userName);
      String tag = pinyin.substring(0, 1).toUpperCase();
      item.namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        item.tagIndex = tag;
      } else {
        item.tagIndex = "#";
      }
    }
    SuspensionUtil.sortListBySuspensionTag(contactData);
  }


      
  Widget _buildListItem(ContactVO model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        ContactItem(item:model,titleName: model.userName, imageName: model.avatarUrl)
      ],
    );
  }

   Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: _suspensionHeight.toDouble(),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            '$susTag',
            textScaleFactor: 1.2,
          ),
          Expanded(
              child: Divider(
            height: .0,
            indent: 10.0,
          ))
        ],
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return AzListView(
      data: _contacts,
      itemBuilder: (context, model) => _buildListItem(model),
      isUseRealIndex: true,
      itemHeight: _itemHeight,
      suspensionHeight: _suspensionHeight,
      header: AzListViewHeader(
          height: 130,
          builder: (context) {
            return ContactHeader();
      }),
  );
  }
}