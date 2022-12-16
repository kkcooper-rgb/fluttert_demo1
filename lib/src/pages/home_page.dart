import 'package:flutter/material.dart';
// import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _getHttp() async {
    print("触发了");
    try {
      var response = await Dio().get('http://www.baidu.com');
      print(response);
    } catch (e) {
      print(e);
    } finally{
      print("66666");
    }
  }
  @override
  Widget build(BuildContext context) {
     _getHttp();
    return Scaffold(
      
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children:  [
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: '美女类型',
              helperText: '请输入你喜欢的类型'
            ),
            onChanged:(value) {
              print(value);
            },
            onSubmitted: (value) {
              print(value);
            },
          )
        ]
      )
    );
  }
}
