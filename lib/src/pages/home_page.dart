import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _imageUrls = [
    'https://www.itying.com/images/flutter/1.png',
    'https://www.itying.com/images/flutter/2.png',
    'https://www.itying.com/images/flutter/3.png',
    // 'https://www.itying.com/images/flutter/4.png',
    // 'https://www.itying.com/images/flutter/5.png',
    // 'https://www.itying.com/images/flutter/6.png',
    // 'https://www.itying.com/images/flutter/7.png',
  ];
  double appBarAlpha = 0;
  _onScroll(Offset){
    double alpha = Offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(Offset);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MediaQuery.removePadding(
              context: context, 
              removeTop: true,
              child: NotificationListener(
                onNotification:(notification) {
                  if (notification is ScrollUpdateNotification && notification.depth==0) {
                    _onScroll(notification.metrics.pixels);
                  }
                  return false;
                },
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 160,
                            child: Swiper(
                              itemCount: _imageUrls.length,
                              autoplay: true,
                              loop: true,
                              pagination: const SwiperPagination(),
                              itemBuilder: (context, index) {
                                return Image.network(
                                  _imageUrls[index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 800,
                      child: Text("23456"),
                    )
                  ],
                ),
              )
            ),
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child:const Expanded(
                  child:Center(
                    child: Text("首页"),
                  )
                )
              ),
            )
          ],
        )
      );
  }
}
