import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context); //kiểm tra xem người dùng đang đăng nhập = điện thoại hay desktop
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),  //khoảng cách của khung "Create room" với 2 bên lề trái phải
      elevation: isDesktop ? 1.0 : 0.0, //bóng của khung "create room" với bên dưới
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null, //khung "create room" là hình chữ nhật cong hay thẳng
      child: Container(
        height: 60.0, //chiều cao của khung "create room"
        color: Colors.white,  //màu nền của khung "create room"
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0, //khoảng cách từ đỉnh phía trên của người đang online và mép trên của khung "create room"
            horizontal: 0.0, //khoảng cách từ viền create room bên trái đến viền trái của khung "create room"
          ),
          scrollDirection: Axis.horizontal, //trượt sang ngang để xem người đang onl"
          itemCount: 1 + onlineUsers.length,  //số lượng người đang onl tối đa
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) { //chỉ số 0 là cái nút "Creae Room" dài
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1]; //trỏ đến người đang online thứ index chạy từ 1 trở đi
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), //khoảng cách giữa 2 người đang onl trong khung Create Room
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(  //hình dạng của nút 'Create Room'
        borderRadius: BorderRadius.circular(30.0),  //là hình chữ nhật cong
      ),
      color: Colors.red,
      borderSide: BorderSide( //viền chữ nhật cong bao quanh chữ "Create Room"
        width: 3.0, //độ dày của cái viền chữ nhật cong bao quanh chữ "Create Room"
        color: Colors.blueAccent[100],  //màu của viền chữ nhật cong bao quanh chữ "Create Room"
      ),
      textColor: Palette.facebookBlue,  //màu của chữ "Create Room" mặc định là màu đen
      child: Row( //các thành phần bên trong khung create room: Máy quay và chữ "Create Room"
        children: [
          // ShaderMask(  //máy quay tự chế
          //   shaderCallback: (rect) =>
          //       Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          Icon( //dùng máy quay có sẵn trong thư viện
            Icons.video_call,
            size: 35.0, //kích thước
            color: Colors.purple,
          ),
          const SizedBox(width: 4.0), //khoảng cách từ máy quay đến chữ "Create Room"
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}
