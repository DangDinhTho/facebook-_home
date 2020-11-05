import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/add_album.dart';
import 'package:flutter_facebook_responsive_ui/widgets/audience.dart';
import 'package:flutter_facebook_responsive_ui/widgets/list_action_post.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class CreatePost extends StatefulWidget {

  final User currentUser;


  const CreatePost({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();

}

class _PostState extends State<CreatePost> {

  bool _keyboardVisible = false;
  String ViewMode = "Public";
  IconData _iconData = Icons.public;
  CreatePost _createPost;
  @override
  Widget build(BuildContext context) {

    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Create Post', style: new TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: [
          FlatButton(
              child: Text('Post', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
              onPressed: () {
                // print('Post');
                //Ấn nút đăng bài
              } //Navigator.push(context, new MaterialPageRoute(builder: null)),

          )
        ],
      ),





      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileAvatar(imageUrl: currentUser.imageUrl,),
                      SizedBox(width: 15.0,),
                      Expanded( //Expanded làm việc với Flex/Flexbox layout. Nó là một trong những widget tốt nhất để phân chia không gian giữa các items với nhau
                        child: Column(  //chủ thớt và (thời gian đăng, chế độ xem) được xếp dọc
                          crossAxisAlignment: CrossAxisAlignment.start, //tên chủ thớt được đặt ở bên trái,

                          children: [
                            Text(
                              currentUser.name, //tên chủ thớt
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,  //độ đậm
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //
                                StreamBuilder<String>(
                                  stream: _loadData(),
                                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(  //Public
                                          height: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(3))
                                          ),
                                          margin: EdgeInsets.only(left: 0),
                                          child: FlatButton(//Public
                                            padding: EdgeInsets.only(left: 2, right: 2),
                                            child: Row(//Public
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [//Public
                                                Icon( //chế độ xem
                                                  _iconData,  //biến thiên
                                                  color: Colors.grey[600],
                                                  size: 15.0,
                                                ),
                                                SizedBox(width: 5.0,),
                                                Text(ViewMode, textDirection: TextDirection.ltr,),  //ViewMode cũng biến thiên
                                                SizedBox(width: 1.0,),
                                                Icon( //chế độ xem
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey[600],
                                                  size: 15.0,
                                                ),
                                              ],//Public

                                            ),//Public
                                            onPressed: () => _navigateAndDisplaySelection(context),  //chọn chế độ xem: Public/ Friend/ Only me
                                          ),//Public

                                        ),//Public
                                      );
                                    } else {
                                      return Center(child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                                //


                                SizedBox(width: 5,),


                                Container(//Album
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(3))
                                  ),
                                  child: FlatButton(//Album
                                    padding: EdgeInsets.only(left: 2, right: 2),
                                    child: Row( //Album
                                      children: [
                                        Icon( //chế độ xem
                                          Icons.add,
                                          color: Colors.grey[600],
                                          size: 15.0,
                                        ),
                                        SizedBox(width: 3.0,),
                                        Text('Album'),
                                        SizedBox(width: 1.0,),
                                        Icon( //chế độ xem
                                          Icons.arrow_drop_down,
                                          color: Colors.grey[600],
                                          size: 15.0,
                                        ),

                                      ],
                                    ),//Album
                                    onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => AddToAlBum())),
                                  ),//Album

                                ),//Album

                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 10),

                  TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                    maxLines: null,
                  ),


                ],
              )
          ),


          ListActionPost(keyboardVisible: _keyboardVisible,)


        ],
      ),
    );
  }

  Future<String> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Audience()),
    );
    if (result == "0") {
      ViewMode = "Public";
      _iconData = Icons.public;
    }
    else if (result == "1") {
      ViewMode = "Friends";
      _iconData = Icons.people;

    }
    else if (result == "2") {
      ViewMode = "Only me";
      _iconData = Icons.lock;

    }
    else {
      ViewMode = "Error";
      _iconData = Icons.error;
    }
      return ViewMode;
  }

  Stream<String> _loadData() async* {
      for (int i = 0; i < 1000; i++) {
        await Future.delayed(Duration(seconds: 1));
        yield ViewMode;
      }
    // yield ViewMode;
  }
}
