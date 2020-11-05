import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class AvatarNotification extends StatelessWidget {
  final String imageUrl;
  //final bool isActive;
  final bool hasBorder;
  final double radius;
  final IconData icon;
  final Color circleColor;

  const AvatarNotification(
      {Key key,
      @required this.imageUrl,
      //this.isActive = false,
      this.hasBorder = false,
      this.radius = 20.0,
      this.icon,
      this.circleColor = Colors.green
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //1 mảng chứa các avatar của từng người
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: radius, //bán kính hình tròn chứa avatar của từng người
            backgroundColor: Palette
                .facebookBlue, //màu nền của hình tròn chứa avatar (Nếu avatar nhỏ hơn nền chứa avatar thì màu nền sẽ hiện ra)
            child: CircleAvatar(
              radius: hasBorder
                  ? 17.0
                  : radius, //background avatar của mọi người đều có màu xanh dương, nếu story đã được xem (hasBorder == false)
              //thì bán kính avatar của người đó sẽ phình to ra để che đi background avatar
              //trái lại (hasBorder == true) tức là story của người đó chưa được xem, thì bán kính avatar sẽ nhỏ lại để lộ ra 1 phần viền của background avatar
              backgroundColor: Colors.grey[200], //0xFFEEEEEE
              backgroundImage: CachedNetworkImageProvider(imageUrl),
            ),
          ),
        ),
        Positioned(
          //đang online
          bottom:
              0.0, //Gốc tọa độ của sáng xanh, càng lớn thì sáng xanh càng dịch lên trên
          right:
              0.0, //Gốc tọa độ của sáng xanh, càng lớn thì sáng xanh càng dịch sang trái
          child: Container(
              height:
                  25.0, //vị trí tương đối của sáng xanh so với gốc tọa độ, càng lớn thì sáng xanh càng dịch lên trên
              width:
                  25.0, //vị trí tương đối của sáng xanh so với gốc tọa độ, càng lớn thì sáng xanh càng dịch sang trái
              decoration: BoxDecoration(
                //sáng xanh online
                color: circleColor, //0xFF4BCB1F màu xanh online
                shape: BoxShape.circle, //hình tròn
                // border: Border.all( //viền trắng bao quanh sáng xanh
                //   width: 2.0, //độ dày
                //   color: Colors.white,  //màu viền
                // ),
              ),
              child: Icon(icon, size: 15, color: Colors.white,)),
        ) //đang offline
      ],
    );
  }
}
