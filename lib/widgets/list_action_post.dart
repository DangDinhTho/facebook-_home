import 'package:flutter/material.dart';


class ListActionPost extends StatelessWidget {

  final keyboardVisible;
  const ListActionPost({
    Key key,
    @required this.keyboardVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !keyboardVisible ? Container(
      width: size.width,
      child: Card(color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular((25)),
              topRight: Radius.circular(25)
          ),),
        // width: size.width,
        margin: EdgeInsets.only(top: size.height * 0.4),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.image, color: Colors.green,),
                title: Text('Image/Video', style: TextStyle(fontWeight: FontWeight.w600),),
                onTap: (){

                },

              ),
              ListTile(
                leading: Icon(Icons.person_add, color: Colors.blue,),
                title: Text('Tag Friends', style: TextStyle(fontWeight: FontWeight.w600),),
                onTap: (){

                },

              ),
              ListTile(
                leading: Icon(Icons.tag_faces, color: Colors.yellow,),
                title: Text('Feeling/Activity', style: TextStyle(fontWeight: FontWeight.w600),),
                onTap: (){

                },

              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.red,),
                title: Text('Check In', style: TextStyle(fontWeight: FontWeight.w600),),
                onTap: (){

                },

              ),
            ],
          ),
        ),
      ),
    ) :
    Align(
      alignment: Alignment.bottomCenter,
      child: Card(color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular((25)),
              topRight: Radius.circular(25)
          ),),
        // width: size.width,
        margin: EdgeInsets.only(bottom: 0),

         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             IconButton(
               icon: Icon(Icons.image, color: Colors.green,),
               onPressed: (){

               },

             ),

             SizedBox(width: 25,),

             IconButton(
               icon: Icon(Icons.person_add, color: Colors.blue,),
               onPressed: (){

               },

             ),
             SizedBox(width: 25,),

             IconButton(
               icon: Icon(Icons.tag_faces, color: Colors.yellow,),
               onPressed: (){

               },

             ),
             SizedBox(width: 25,),

             IconButton(
               icon: Icon(Icons.location_on, color: Colors.red,),
               onPressed: (){

               },

             ),
             SizedBox(width: 25,),

             IconButton(
               icon: Icon(Icons.more_horiz, color: Colors.grey,),
               onPressed: (){

               },

             )
           ],
         ),
      ),
    );
  }
}

