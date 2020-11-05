
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),

      body: Column(
        children: [


          Expanded(
            child: ListView(   // danh sách người like
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15, bottom: 8),
                  child: Text("Earlier", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                  NotificationItem(content: "đã nhắc đến bạn trong một bình luận", icon: Icons.comment, circleColor: Colors.green,user: new User(name: "Hello", imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80")),
                  NotificationItem(content: "đã thích ảnh của bạn", icon: Icons.thumb_up, circleColor: Colors.blue, seen: true ,user: new User(name: "Hello", imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80")),
                  NotificationItem(content: "đã nhắc đến bạn trong một bình luận", icon: Icons.comment, circleColor: Colors.green,user: new User(name: "Hello", imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80"))

              ],
            ),
          )
        ],
      ),
    );
  }
}
