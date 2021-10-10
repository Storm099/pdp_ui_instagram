import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui_instagram/pages/feed_page.dart';


class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentpage = 0;

  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Feather.camera),
          color: Colors.grey,
          onPressed: (){

          },
        ),
        title: const Text("Instagram",style: TextStyle(color: Colors.grey,fontSize: 18),),
        actions: [
          IconButton(
            icon: const Icon(Feather.tv),
            color: Colors.grey,
            onPressed: (){

            },
          ),
          IconButton(
            icon: const Icon(FontAwesome.send_o),
            color: Colors.grey,
            onPressed: (){

            },
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: _pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentpage,
        onTap: (i){
          setState(() {
            currentpage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: "Feed" ,
          ),

          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            label: "Uploads",
          ),

          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            label: "Likes",
          ),

          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            label: "Account",
          )
        ],
      ),
    );
  }
}
