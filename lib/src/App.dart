import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/my_page.dart';
import './pages/search_page.dart';
import './pages/travel_page.dart';
class App extends StatefulWidget {
   const App({ Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const List _currentPages =[
    HomePage(),
    TravelPage(),
    SearchPage(),
    MyPage(),
  ];
  static const List<BottomNavigationBarItem> _BottomTabBars = [
     BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "首页"
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.flight_class),
      label: "分类"
    ),
       BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "购物车"
    ),
       BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: "我的"
    ),
  ];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试页面"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        type: BottomNavigationBarType.fixed,
        items: _BottomTabBars,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        }
      ),
      body: _currentPages[_currentIndex],
    );
  }
}