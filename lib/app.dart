
import 'package:flutter/material.dart';
import 'package:tbcontact/contacts/contacts.dart';
import 'package:tbcontact/conversations/converstation.dart';
import 'package:tbcontact/news/news.dart';


enum ItemType { GroupChat, AddFriends, QrCode, Payments, Help}


class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentIndex = 0;
  ConverstationPage chatPage;
  Contacts contacts;
  News news;
  currentPage(){
     switch (_currentIndex) {
       case 0:
         if(chatPage == null){
           chatPage = new ConverstationPage();
         }
         return chatPage;
       case 1:
         if(contacts == null){
           contacts = new Contacts();
         }
         return contacts;
      case 2:
        if(news == null){
          news = new News();
        }
     return news;
//       case 3:
//         if(me == null){
//           me = new Personal();
//         }
//         return me;
//       default;
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拉萨海关通讯录'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 20.0),
            child: GestureDetector(
              child: Icon(Icons.add),
                onTap: (){
                showMenu(context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      _popupMenuItem('帮助与反馈',icon: Icons.email),
                    ],
                );
              },
            ),
          ),
        ],
      ),
       bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          new BottomNavigationBarItem(
              title: new Text(
                '消息',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/weixin_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/weixin_normal.png',
                      width: 32.0,
                      height: 28.0,
              )),
          new BottomNavigationBarItem(
              title: new Text(
                '通讯录',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                'images/contact_list_pressed.png',
                width: 32.0,
                height: 28.0,
              )
                  : Image.asset(
                'images/contact_list_normal.png',
                width: 32.0,
                height: 28.0,
              )),
          new BottomNavigationBarItem(
              title: new Text(
                '发现',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                'images/find_pressed.png',
                width: 32.0,
                height: 28.0,
              )
                  : Image.asset(
                'images/find_normal.png',
                width: 32.0,
                height: 28.0,
              )),
          new BottomNavigationBarItem(
              title: new Text(
                '我',
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 3
                  ? Image.asset(
                'images/profile_pressed.png',
                width: 32.0,
                height: 28.0,
              )
                  : Image.asset(
                'images/profile_normal.png',
                width: 32.0,
                height: 28.0,
              )),
        ],
      ),
       body: currentPage(),
    );
  }

  _popupMenuItem(String title, {String imagePath,IconData icon}){
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
            ? Image.asset(
            imagePath,
            width: 32.0,
            height: 32.0,
          ): SizedBox(
            width: 32.0,
            height: 32.0,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

}