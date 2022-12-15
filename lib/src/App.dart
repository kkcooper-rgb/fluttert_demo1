import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/my_page.dart';
import './pages/search_page.dart';
import './pages/travel_page.dart';
class App extends StatefulWidget {
   App({ Key? key,required this.title }) : super(key: key);
   String title;
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List _currentPages =[
    const HomePage(),
    const TravelPage(),
    const SearchPage(),
    const MyPage(),
  ];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "旅拍"
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "搜索"
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "我的"
          ),
        ],
      ),
      body: _currentPages[_currentIndex],
    );
  }
}