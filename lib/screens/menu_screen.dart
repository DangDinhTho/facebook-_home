import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/menu_item.dart';

import '../widgets/profile_avatar.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: [

          FlatButton(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ProfileAvatar(radius: 20, imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
                    Text("View your profile", style: TextStyle(color: Colors.black54),)
                  ],
                )
              ],
            ),

            onPressed: (){
              print("Profile");
              // Navigator.push(context, new MaterialPageRoute(
              //     builder: (context) => Scaffold())
              //);
            },
          ),

          Divider(
            indent: 8.0,
            endIndent: 8.0,
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    MenuItem(icon: Icon(Icons.people, color: Colors.blueAccent,), tittle: "Friend",),
                    MenuItem(icon: Icon(Icons.store, color: Colors.blueAccent,), tittle: "Marketplace",),
                    MenuItem(icon: Icon(Icons.update, color: Colors.blueAccent,), tittle: "Memories",),
                    MenuItem(icon: Icon(Icons.favorite, color: Colors.pinkAccent,), tittle: "Dating",),
                    MenuItem(icon: Icon(Icons.videogame_asset, color: Colors.blueAccent,), tittle: "Gaming",),
                  ],
                ),

                Column(
                  children: [
                    MenuItem(icon: Icon(Icons.flag, color: Colors.orangeAccent,), tittle: "Pages",),
                    MenuItem(icon: Icon(Icons.group, color: Colors.blueAccent,), tittle: "Groups",),
                    MenuItem(icon: Icon(Icons.live_tv, color: Colors.blueAccent,), tittle: "Videos on Watch", subTittle: "1 new video",),
                    MenuItem(icon: Icon(Icons.event, color: Colors.redAccent,), tittle: "Events",),
                    MenuItem(icon: Icon(Icons.business_center, color: Colors.orangeAccent,), tittle: "Jobs",),
                    MenuItem(icon: Icon(Icons.bookmark, color: Colors.purpleAccent,), tittle: "Saved",),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
