import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/search_body.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _folded = false;
  bool _result = false;
  TextEditingController _editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        elevation: 1,
        //leading: ,
        actions: [
         Container(

           margin: EdgeInsets.all(10),

           width: 310,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(30))
           ),
           child: Padding(
             padding: const EdgeInsets.only(left: 10.0),
             child: TextField(
               controller: _editingController,
               decoration: InputDecoration(
                   //contentPadding: EdgeInsets.only(left: 10),

                   hintText: 'Search',
                   hintStyle: TextStyle(color: Colors.blue[300]),
                   border: InputBorder.none,
                 suffixIcon: _folded?IconButton(
                   icon: Icon(Icons.cancel, color: Colors.grey,),
                   iconSize: 20,
                   onPressed: (){
                    _editingController.clear();
                     //print(_editingController.);
                   },
                 ) : null
               ),
               onChanged: (string){

                 setState(() {
                   if(string != "") {
                     _folded = true;
                   }
                   else
                     _folded = false;
                 }) ;

                 print("Tap");
               },
               onSubmitted: (str){
                 setState(() {
                   _result = true;
                 });
               },

               onTap: (){
                 setState(() {
                   _result = false;
                 });
               },
             ),
           ),
         )
          ,
          //SizedBox(width: 100,)
        ],
      ),

      body: SearchBody(folded: _folded, editingController: _editingController, result: _result,),
    );
  }
}
