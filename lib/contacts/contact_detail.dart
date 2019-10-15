import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tbcontact/common/appconst.dart';
import 'package:tbcontact/common/application.dart';
import 'package:tbcontact/common/phoneslider.dart';
import 'package:tbcontact/common/touch_callback.dart';
import 'package:tbcontact/contacts/contact_vo.dart';
import 'package:flushbar/flushbar.dart';
import 'package:tbcontact/contacts/topcontact_vo.dart';

class ContactDetail extends StatefulWidget {
  final ContactVO contactVo;
  final bool fromTopContact;
  const ContactDetail({
    Key key,
    this.fromTopContact,
    this.contactVo,
  }) : super(key: key);
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  bool isaTopContact = false;

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
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          title: Text(widget.contactVo.userName + '信息'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        '头像',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Image.network(
                      widget.contactVo.avatarUrl.isEmpty
                          ? AppConst.defaultAvatar
                          : widget.contactVo.avatarUrl,
                      width: 50.0,
                      height: 50.0,
                      scale: 0.9,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '姓名',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.contactVo.userName,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '部门',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.contactVo.department,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '科室',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.contactVo.subDepartment,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '职务',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.contactVo.position,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
            PhoneSlider(
              number: widget.contactVo.officePhone,
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        '办公电话',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        widget.contactVo.officePhone,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            PhoneSlider(
              number: widget.contactVo.shortPhone,
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        '短号码',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        widget.contactVo.shortPhone ?? '--',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            PhoneSlider(
              number: widget.contactVo.homePhone,
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        '住宅电话',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        widget.contactVo.homePhone,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '房间号',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.contactVo.roomNumber,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '居住地',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.contactVo.address,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: (!widget.fromTopContact)
            ? new FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: isaTopContact ? Colors.redAccent : null,
                onPressed: () async {
                  if (isaTopContact) {
                    Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      shadowColor: Colors.blue[800],
                      duration: Duration(seconds: 3),
                      isDismissible: false,
                      icon: Icon(
                        Icons.warning,
                        color: Colors.yellowAccent,
                      ),
                      titleText: new Text(
                        "操作提醒",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.yellow[600],
                        ),
                      ),
                      mainButton: FlatButton(
                        onPressed: () async {
                          var dio = new Dio();
                          var res = await dio.get(
                              "${AppConst.topcontactUrl}?UserId=${Application.loginUserId}&TopContactId=${widget.contactVo.id}");
                          if (res.data.length > 0) {
                            var tc = TopContactVO.fromJson(res.data[0]);
                            await dio
                                .delete("${AppConst.topcontactUrl}/${tc.id}");
                            setState(() {
                              isaTopContact = false;
                            });
                          }
                        },
                        child: Text(
                          "确定",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      messageText: new Text(
                        "你确定从常用联系人列表中移除此联系人？",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: "ShadowsIntoLightTwo"),
                      ),
                    )..show(context);
                  } else {
                    var dio = new Dio();
                    await dio.post("${AppConst.topcontactUrl}", data: {
                      "UserId": Application.loginUserId,
                      "TopContactId": widget.contactVo.id
                    });
                    Flushbar(
                      backgroundGradient: new LinearGradient(
                          colors: [Colors.blueGrey, Colors.black]),
                      isDismissible: false,
                      duration: Duration(seconds: 2),
                      icon: Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                      ),
                    )
                      ..title = "添加成功"
                      ..message = "该联系人已经成功添加到常用联系人列表"
                      ..backgroundColor = Colors.red
                      ..shadowColor = Colors.blue[800]
                      ..show(context);

                    setState(() {
                      isaTopContact = true;
                    });
                  }
                },
                tooltip: '收藏',
                child: new Icon(
                  Icons.favorite,
                ),
              )
            : null);
  }

  checkTopContact() async {
    var dio = new Dio();
    var userRes = await dio.get(
        "${AppConst.topcontactUrl}?UserId=${Application.loginUserId}&TopContactId=${widget.contactVo.id}");
    setState(() {
      isaTopContact = userRes.data.length > 0;
    });
  }

  @override
  void initState() {
    super.initState();
    checkTopContact();
  }
}
