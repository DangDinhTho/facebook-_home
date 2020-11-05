import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/widgets/avatar_notification.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final User user;
  final String content;
  final bool seen;
  final IconData icon;
  final Color circleColor;

  const NotificationItem({
    Key key,
    @required this.user,
    this.content,
    this.seen = false,
    this.icon,
    this.circleColor
  }) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: seen ? Colors.white: Colors.blue[50],
      //width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
      //height: 35,
      child: Row(
        children: [
          FlatButton(
            child: Row(
              children: [
                AvatarNotification(
                  radius: 30.0,
                  imageUrl: user.imageUrl,
                  icon: icon,
                  circleColor: circleColor,
                ),
                SizedBox(width: 15,),
                Container(
                  width: 210,
                  child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: user.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                          TextSpan(text: " " + content, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black))
                        ]

                  )),
                )
              ],
            ),
          ),
          //SizedBox(width: 0,),

          Container(
            child: IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.black,
              )
            ),
          )
        ],
      ),
    );
  }
}
