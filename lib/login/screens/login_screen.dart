// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fakebook_homepage/login/utilities/constants.dart';
// import 'package:fakebook_homepage/screens/home_screen.dart';
// import 'package:fakebook_homepage/screens/nav_screen.dart';
// import 'package:fakebook_homepage/screens/screens.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _rememberMe = false;
//   String username;
//   String password;
//
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences prefs;
//
//   bool isLoading = false;
//   bool isLoggedIn = false;
//   User currentUser;
//
//   // //Xử lý JSON
//   // File jsonFile;
//   // Directory dir;
//   // String fileName = "LoginInformation.json";
//   // bool fileExists = false;
//   // Map<String, dynamic> fileContent;
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getApplicationDocumentsDirectory().then((Directory directory) {
//   //     dir = directory;
//   //     jsonFile = new File(dir.path + "/" + fileName);
//   //     fileExists = jsonFile.existsSync();
//   //     if (fileExists)
//   //       this.setState(
//   //               () => fileContent = json.decode(jsonFile.readAsStringSync())
//   //       );
//   //   });
//   // }
//   //
//   // // @override
//   // // void dispose() {
//   // //   keyInputController.dispose();
//   // //   valueInputController.dispose();
//   // //   super.dispose();
//   // // }
//   //
//   // void createFile(
//   //     Map<String, dynamic> content, Directory dir, String fileName) {
//   //   print("Creating file!");
//   //   File file = new File(dir.path + "/" + fileName);
//   //   file.createSync();
//   //   fileExists = true;
//   //   file.writeAsStringSync(json.encode(content));
//   // }
//   //
//   // void writeToFile(String key, dynamic value) {
//   //   print("Writing to file!");
//   //   Map<String, dynamic> content = {key: value};
//   //   if (fileExists) {
//   //     print("File exists");
//   //     print(dir.path + "/" + fileName);
//   //     Map<String, dynamic> jsonFileContent =
//   //     json.decode(jsonFile.readAsStringSync());
//   //     jsonFileContent.addAll(content);
//   //     jsonFile.writeAsStringSync(json.encode(jsonFileContent));
//   //   } else {
//   //     print("File does not exist!");
//   //     createFile(content, dir, fileName);
//   //   }
//   //   this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
//   //   print(fileContent);
//   // }
//   // //Hết xử lý JSON
//
//   @override
//   void initState() {
//     super.initState();
//     isSignedIn(); //hàm kiểm tra xem có đăng nhập hay ko
//   }
//   void isSignedIn() async {//hàm kiểm tra xem có đăng nhập hay ko, đc gọi khi đăng xuất và khi mở lại ứng dụng
//     this.setState(() {
//       isLoading = true; //xoay vòng
//     });
//
//     prefs = await SharedPreferences.getInstance();  //moi các trường trong firebase
//     print("prefs đăng xuất = " + prefs.toString());
//
//     isLoggedIn = await googleSignIn.isSignedIn();
//     print("isLoggedIn = " + isLoggedIn.toString());
//     if (isLoggedIn) { //đảm bảo rằng 1 khi isLoggedIn = true thì luôn chuyển hướng sang màn hình đăng nhập
//       print("prefs đăng nhập 1 = " + prefs.toString()); //khi mở lại ứng dụng trong trạng thái đã đăng nhập
//       print("-----------------------prefs.getString('id') = " + prefs.getString('id'));
//       Navigator.push( //điều hướng sang màn hình mới (Màn hình HomeScreen)
//         context,  //điều hướng từ
//         MaterialPageRoute(  //điều hướng sang
//           //bên dưới cũng có hàm route sang NavScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
//             builder: (context) => NavScreen(currentUserId: prefs.getString('id')) //chuyển sang home page chứa 6 cái màn hình
//         ),
//
//       );
//     }
//
//     this.setState(() {
//       isLoading = false;  //không xoay nữa
//     });
//   }
//
//   Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//     //nút Facebook và GG chung
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 60.0, //chiều rộng và chiều cao của cái khung chứa cả 2 nút
//         width: 60.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.yellow,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.greenAccent, //màu của bóng mờ
//               offset: Offset(0, 2), //tọa độ làm mờ, lấy (0,0) làm tâm
//               blurRadius: 8.0, //phân tán độ mờ (càng cao thì càng loãng)
//             ),
//           ],
//           image: DecorationImage(
//             image: logo,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Future<Null> handleSignIn() async { //xử lý đăng nhập
//     prefs = await SharedPreferences.getInstance();  //Instance of 'SharedPreferences', xuất hiện khi người dùng ấn nút đăng nhập
//
//     this.setState(() {
//       isLoading = true;
//     });
//     print("prefs đăng nhập 2 = " + prefs.toString());
//
//     GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     User firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user; //lấy thông tin của người đăng nhập
//
//     print("kiểm tra firebaseUser có null ko, firebaseUser = " + firebaseUser.toString());
//     if (firebaseUser != null) { //nếu tìm thấy tài khoản google của người này trong firebase
//       // Check is already sign up
//       print("-------------------------------firebaseUser Khác null, = " + firebaseUser.toString());
//       final QuerySnapshot result = await FirebaseFirestore.instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
//           .collection('users')
//           .where('id', isEqualTo: firebaseUser.uid)
//           .get(); //tìm kiếm id của người này dựa trên id trong tài khoản google đã đăng nhập
//
//       print("Giá trị của QuerySnapshot result là " + result.toString());//[Instance of 'QueryDocumentSnapshot']
//
//       final List<DocumentSnapshot> documents = result.docs; //mảng này chỉ chứa 0 hoặc 1 phần tử, tương ứng với người dùng chưa hoặc đã có trên firebase
//       print("-----------------------Giá trị của document = " + documents[0].toString());  //chứa duy nhất 1 phần tử, cho biết có query được hay ko
//       if (documents.length == 0) {  //nếu người dùng đăng nhập lần đầu //document[0] = Instance of 'QueryDocumentSnapshot'
//         // Update data to server if new user  //cập nhật dữ liệu lên server
//         FirebaseFirestore.instance
//             .collection('users')  //bảng user
//             .doc(firebaseUser.uid)  //tại id mới
//             .set({  //set các thuộc tính cho người dùng mới
//           'nickname': firebaseUser.displayName,
//           'photoUrl': firebaseUser.photoURL,
//           'id': firebaseUser.uid,
//           'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
//           'chattingWith': null  ////người mà tôi đang chat ban đầu khi mới đăng nhập là null
//         });
//
//         // Write data to local
//         currentUser = firebaseUser; //lấy dữ liệu trong firebase thì cũng cần phải cập nhật lại công cụ moi dữ liệu luôn
//         await prefs.setString('id', currentUser.uid);
//         await prefs.setString('nickname', currentUser.displayName);
//         await prefs.setString('photoUrl', currentUser.photoURL);
//       } else { //nếu người dùng đăng nhập lần hai trở đi, thì tức là đã có tên trong firestore rồi  //document[0] = Instance of 'QueryDocumentSnapshot'
//         // Write data to local
//         await prefs.setString('id', documents[0].data()['id']);
//         await prefs.setString('nickname', documents[0].data()['nickname']);
//         await prefs.setString('photoUrl', documents[0].data()['photoUrl']);
//         await prefs.setString('aboutMe', documents[0].data()['aboutMe']);
//       }
//       Fluttertoast.showToast(msg: "Đăng nhập thành công");
//       this.setState(() {
//         isLoading = false;
//       });
//       print("-----------------------firebaseUser.uid = " + firebaseUser.uid);
//       Navigator.push( //điều hướng sang màn hình mới (Màn hình HomeScreen)
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//               // HomeScreen(currentUserId: firebaseUser.uid)));
//
//               NavScreen(currentUserId: firebaseUser.uid))//bên trên cũng có hàm route sang NavScreen, nhưng route ở dưới đây là route khi ấn nút sign-in, chứ ko phải thực hiện ngay khi mở app lần đầu
//       );
//     } else {  //đăng nhập thất bại do không tìm thấy tên trên firestore
//       print("firebaseUser bằng null null");
//       Fluttertoast.showToast(msg: "Sign in fail");
//       this.setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   //màu nền của ứng dụng
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xFFFFC966),
//                       Color(0xFFFFC04C),
//                       Color(0xFFFFB732),
//                       Color(0xFFE59400),
//                     ],
//                     stops: [0.1, 0.4, 0.7, 0.9],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: double.infinity,
//                 //chiều cao của màn hình ứng dụng = matchparent
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   //cho phép cuộn màn hình
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 40.0,
//                     //khoảng cách từ body đến 2 mép dọc màn hình
//                     vertical: 120.0,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         'FAKEBOOK',
//                         style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontFamily: 'OpenSans',
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       //
//
//
//
//                       // _buildEmailTF(),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         //chữ email thẳng hàng với khung nhập tài khoản
//                         children: <Widget>[
//                           Text(
//                             'Tài khoản/ Email',
//                             style: kLabelStyle,
//                           ),
//                           SizedBox(height: 10.0),
//                           //chiều cao của khung nhập email
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             //chữ Enter your Email nằm ở giữa, bên trái
//                             decoration: kBoxDecorationStyle,
//                             //khung nhập email có viền trắng bao quanh
//                             height: 60.0,
//                             //chiều cao của khung nhập email
//                             child: TextField(
//                               keyboardType: TextInputType.emailAddress,
//                               //Yêu cầu người dùng phải nhập email trong khung
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 //màu chữ khi người dùng nhập vào thanh email
//                                 fontFamily: 'OpenSans',
//                               ),
//                               decoration: InputDecoration(
//                                 //cái khung nhập email
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(top: 14.0),
//                                 //vị trí của Chữ "Enter your Email" cách viền trên của khung nhập email bao nhiêu
//                                 prefixIcon: Icon(
//                                   //cái phong bì bên trái khung nhập email
//                                   Icons.email,
//                                   color: Colors.greenAccent,
//                                 ),
//                                 hintText: 'Tài khoản/ Email', //hint
//                                 hintStyle: kHintTextStyle, //hint
//                               ),
//                               onChanged: (text) {
//                                 username = text;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       //
//                       SizedBox(
//                         //khoảng cách từ khung nhập email đến khung nhập password là 30
//                         height: 30.0,
//                       ),
//                       // _buildPasswordTF(),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Mật khẩu',
//                             style: kLabelStyle,
//                           ),
//                           SizedBox(height: 10.0),
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             decoration: kBoxDecorationStyle,
//                             height: 60.0,
//                             child: TextField(
//                               obscureText: true,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'OpenSans',
//                               ),
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(top: 14.0),
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   color: Colors.greenAccent,
//                                 ),
//                                 hintText: 'Mật khẩu',
//                                 hintStyle: kHintTextStyle,
//                               ),
//                               onChanged: (text) {
//                                 password = text;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       //
//
//
//
//                       // _buildForgotPasswordBtn(),
//                       Container(
//                         alignment: Alignment.centerRight,
//                         child: FlatButton(
//                           onPressed: () =>
//                               print('Forgot Password Button Pressed'),
//                           padding: EdgeInsets.only(right: 0.0),
//                           //cách lề phải bao nhiêu
//                           child: Text(
//                             'Quên mật khẩu?',
//                             style: kLabelStyle,
//                           ),
//                         ),
//                       ),
//                       //
//
//
//
//                       // _buildRememberMeCheckbox(),
//                       Container(
//                         height: 20.0, //chiều cao của _buildRememberMeCheckbox
//                         child: Row(
//                           children: <Widget>[
//                             Theme(
//                               data: ThemeData(
//                                   unselectedWidgetColor: Colors.purple),
//                               //viền checkBox
//                               child: Checkbox(
//                                 value: _rememberMe,
//                                 checkColor: Colors.deepOrange,
//                                 //màu dấu tích
//                                 activeColor: Colors.yellow,
//                                 //màu nền của dấu tích
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _rememberMe = value;
//                                   });
//                                 },
//                               ),
//                             ),
//                             Text(
//                               'Ghi nhớ đăng nhập',
//                               style: kLabelStyle,
//                             ),
//                           ],
//                         ),
//                       ),
//                       //
//
//
//
//                       // _buildLoginBtn(),
//                       Container(
//                         padding: EdgeInsets.symmetric(vertical: 25.0),
//                         //khoảng cách giữa nút ĐĂNG NHẬP và các thành phần trên, dưới với nó
//                         width: double.infinity,
//                         //chiều ngang của nút ĐĂNG NHẬP = matchparent
//                         child: RaisedButton(
//                           elevation: 5.0,
//                           onPressed: () => {
//                             print('Login Button Pressed'),
//                             // writeToFile(username, password),  //xử lý json
//                           },
//
//                           padding: EdgeInsets.all(15.0),
//                           //khoảng cách từ chữ ĐĂNG NHẬP đến 2 viền trên dưới của nút ĐĂNG NHẬP
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           color: Colors.white,
//                           child: Text(
//                             'ĐĂNG NHẬP',
//                             style: TextStyle(
//                               color: Color(0xFF527DAA),
//                               letterSpacing: 1.5,
//                               //Khoảng cách giữa cách chữ Đ, Ă, N, G, N, H, Ậ, P
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'OpenSans',
//                             ),
//                           ),
//                         ),
//                       ),
//                       //
//
//
//
//                       // _buildSignInWithText(),
//                       Column(
//                         children: <Widget>[
//                           Text(
//                             '- HOẶC -',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w400, //độ đậm của chữ HOẶC
//                             ),
//                           ),
//                           SizedBox(height: 20.0),
//                           //khoảng cách giữa HOẶC và Đăng nhập bằng
//                           Text(
//                             'Đăng nhập bằng',
//                             style: kLabelStyle,
//                           ),
//                         ],
//                       ),
//                       //
//
//
//
//                       // _buildSocialBtnRow(),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 30.0),
//                         //khoảng cách từ _buildSocialBtnRow tới 2 widget trên dưới với nó
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           //vị trí tương đối của các hình tròn
//                           children: <Widget>[
//                             _buildSocialBtn(
//                               () => print('Login with Facebook'),
//                               AssetImage('assets/logos/facebook.png'),
//                             ),
//                             _buildSocialBtn(
//                               () => handleSignIn(),
//                               AssetImage('assets/logos/google.jpg'),
//                             ),
//                           ],
//                         ),
//                       ),
//                       //
//
//
//
//                       // _buildSignupBtn(),
//                       GestureDetector(
//                         onTap: () => print('Sign Up Button Pressed'),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Chưa có tài khoản? ',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Đăng ký ngay',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       //
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
