import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/person_like_item.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class ListLike extends StatelessWidget {
  final Post post;

  const ListLike({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People who like this"),
      ),
      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            //height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(
                      4.0), //kích cỡ của hình bao quanh icon like
                  decoration: BoxDecoration(
                    //hình bao quanh icon like
                    color: Palette
                        .facebookBlue, //hình bao quanh icon like có nền xanh
                    shape:
                        BoxShape.circle, //hình bao quanh icon like là hình tròn
                  ),
                  child: const Icon(
                    //icon like
                    Icons.thumb_up,
                    size: 10.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '${post.likes}', //số like
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey,),

          Expanded(
            child: ListView(   // danh sách người like
              children: [
                PersonLikeItem(user: post.user,),
                PersonLikeItem(user: post.user,),
                PersonLikeItem(user: post.user,),


              ],
            ),
          )
        ],
      ),
    );
  }
}
