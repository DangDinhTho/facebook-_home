import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/comment_model.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/comment_item.dart';

class ListComment extends StatelessWidget {
  final Post post;
  const ListComment({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular((10)),
            topRight: Radius.circular(10)
        ),),
      child: Column(
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
          Divider(
            color: Colors.grey,
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(top: 0),
            alignment: Alignment.centerLeft,
            child: FlatButton(
              //padding: EdgeInsets.only(top: 0),
              child: Text("More comments...", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              children: [
                CommentItem(
                  comment: new Comment(
                      user: new User(
                          name: 'Hello',
                          imageUrl:
                              'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                      content: 'Hay vcl',
                      time: '5 min ago'),
                ),
                CommentItem(
                  comment: new Comment(
                      user: new User(
                          name: 'Hello',
                          imageUrl:
                              'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                      content:
                          'Cat dau moi a, viet cho dai ra thoi, xuong dong ho bo cai',
                      time: '15 min ago'),
                ),
                CommentItem(
                  comment: new Comment(
                      user: new User(
                          name: 'Hello',
                          imageUrl:
                              'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                      content:
                          'I like that, I very like that, like that very much, vcl van chua xuong dong a',
                      time: '1 hour ago'),
                ),

                CommentItem(
                  comment: new Comment(
                      user: new User(
                          name: 'Hello',
                          imageUrl:
                          'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                      content:
                      'I like that, I very like that, like that very much, vcl van chua xuong dong a',
                      time: '1 hour ago'),
                ),

                CommentItem(
                  comment: new Comment(
                      user: new User(
                          name: 'Hello',
                          imageUrl:
                          'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                      content:
                      'I like that, I very like that, like that very much, vcl van chua xuong dong a',
                      time: '1 hour ago'),
                ),

                CommentItem(
                  comment: new Comment(
                      user: new User(
                          name: 'Hello',
                          imageUrl:
                          'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
                      content:
                      'I like that, I very like that, like that very much, vcl van chua xuong dong a',
                      time: '1 hour ago'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
