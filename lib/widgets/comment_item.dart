import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/comment_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({Key key, @required this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(
            radius: 20.0,
            imageUrl: comment.user.imageUrl,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                    constraints: BoxConstraints(
                      //minWidth: 300.0,
                      maxWidth: 300.0,
                      //minHeight: 30.0,
                      //maxHeight: 100.0,
                    ),
                //margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(10),
                //width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(comment.user.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(comment.content, maxLines: null,)
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(comment.time),
              )
            ],
          ),

        ],
      ),
    );
  }
}
