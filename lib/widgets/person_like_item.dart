import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class PersonLikeItem extends StatelessWidget {
  final User user;

  const PersonLikeItem({
    Key key,
    @required this.user
}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Row(
        children: [
          FlatButton(
            child: Row(
              children: [
                ProfileAvatar(radius: 15.0,
                  imageUrl: user.imageUrl,),
                SizedBox(width: 15,),
                Text(user.name, style: TextStyle(color: Colors.black),),
              ],
            ),
          ),
          SizedBox(width: 150,),

          Expanded(
            child: Container(
              width: 80,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(2),
              child: FlatButton(
                padding: EdgeInsets.only(left: 1, right: 1),
                color: Palette.facebookBlue,
                child: Text("Add Friend", style: TextStyle(color: Colors.white, fontSize: 10),),
                onPressed: (){
                  print("Add Friend");
                  print(user.imageUrl);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
