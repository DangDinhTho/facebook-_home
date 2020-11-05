import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class SearchBody extends StatelessWidget {
  final bool folded;
  final bool result;
  final TextEditingController editingController;

  const SearchBody({
    Key key,
    @required this.folded, this.result,
    @required this.editingController,
}) : super(key:key);
  @override
  Widget build(BuildContext context) {

    if(!result) {
      return !folded ? Column(
        children: [

          Container(
            height: 30,
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Row(
              children: [
                Text("Recent Searches", style: TextStyle(fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
                SizedBox(width: 140,),
                FlatButton(
                  child: Text("Edit", style: TextStyle(color: Colors.blue),
                    textDirection: TextDirection.rtl,),
                )

              ],
            ),
          ),

          // ListTile(
          //   title: Text("Recent Searches"),
          //   trailing: FlatButton(
          //     child: Text("Edit", style: TextStyle(color: Colors.blue),),
          //   ),
          // ),

          new Divider(color: Colors.grey),

          Container(
            height: 35,
            child: FlatButton(
              child: Row(
                children: [
                  ProfileAvatar(radius: 15.0,
                    imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                  SizedBox(width: 15,),
                  Text("Name", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),

          Container(
            height: 35,
            child: FlatButton(
              child: Row(
                children: [
                  ProfileAvatar(radius: 15.0,
                    imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                  SizedBox(width: 15,),
                  Text("Name", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),

          Container(
            height: 35,
            child: FlatButton(
              child: Row(
                children: [
                  ProfileAvatar(radius: 15.0,
                    imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                  SizedBox(width: 15,),
                  Text("Name", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),
        ],
      ) :
      Column(
        children: [
          Container(
            height: 35,
            child:
            ListTile(
              leading: Icon(Icons.search),
              title: Text(editingController.text),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),
        ],
      );
    }

    else{
      return Column(
        children: [

          Container(
            height: 15,
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Row(
              children: [
                Text("People", style: TextStyle(fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
                // SizedBox(width: 140,),
                // FlatButton(
                //   child: Text("Edit", style: TextStyle(color: Colors.blue),
                //     textDirection: TextDirection.rtl,),
                // )

              ],
            ),
          ),

          // ListTile(
          //   title: Text("Recent Searches"),
          //   trailing: FlatButton(
          //     child: Text("Edit", style: TextStyle(color: Colors.blue),),
          //   ),
          // ),

          new Divider(color: Colors.grey),

          Container(
            height: 35,
            child: FlatButton(
              child: Row(
                children: [
                  ProfileAvatar(radius: 15.0,
                    imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                  SizedBox(width: 15,),
                  Text("Name", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),

          Container(
            height: 35,
            child: FlatButton(
              child: Row(
                children: [
                  ProfileAvatar(radius: 15.0,
                    imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                  SizedBox(width: 15,),
                  Text("Name", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),

          Container(
            height: 35,
            child: FlatButton(
              child: Row(
                children: [
                  ProfileAvatar(radius: 15.0,
                    imageUrl: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",),
                  SizedBox(width: 15,),
                  Text("Name", style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),

          new Divider(color: Colors.grey, indent: 15,),
        ],
      );
    }
  }
}

