import 'package:azlistview/azlistview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:tbcontact/common/appconst.dart';
import 'package:tbcontact/common/application.dart';
import 'package:tbcontact/common/touch_callback.dart';
import 'package:tbcontact/contacts/contact_item.dart';
import 'package:tbcontact/contacts/contact_vo.dart';
import 'package:tbcontact/contacts/topcontact_vo.dart';

class TopContacts extends StatefulWidget {
  _TopContactsState createState() => _TopContactsState();
}

class _TopContactsState extends State<TopContacts> {
  List<ContactVO> _contacts = [];
  List<ContactVO> _topContacts = [];
  int _suspensionHeight = 40;
  int _itemHeight = 60;

  void loadData() async {
    var dio = new Dio();
    List<String> topcontactIds = [];
    var topcRes = await dio.get(
        "${AppConst.topcontactUrl}?UserId=${Application.loginUserId}&_limit=600");
    for (var tcJson in topcRes.data) {
      topcontactIds.add(TopContactVO.fromJson(tcJson).topcontactId);
    }
    if (topcontactIds.length == 0) {
      _handleList(_contacts);
      setState(() {});
      return;
    }
    var response = await dio.get("${AppConst.contactUrl}?_limit=600");
    for (var item in response.data) {
      var co = ContactVO.fromJson(item);
      if (co.avatarUrl.isEmpty) {
        co.avatarUrl = AppConst.defaultAvatar;
      }
      _contacts.add(co);
    }
    for (var item in _contacts) {
      if (topcontactIds.contains(item.id)) _topContacts.add(item);
    }
    _handleList(_topContacts);
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
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
        ContactItem(item: model, titleName: model.userName, imageName: model.avatarUrl, fromTopContact: true)
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
    return Scaffold(
      appBar: AppBar(
        leading: TouchCallBack(
          isfeed: false,
          onPressed: () {
            Navigator.pop(context);
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
        title: Text('常用联系人'),
      ),
      body: _topContacts.length == 0
          ? Center(
              child: Text('暂无常用联系人数据'),
            )
          : AzListView(
              data: _topContacts,
              itemBuilder: (context, model) => _buildListItem(model),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _suspensionHeight),
    );
  }
}
