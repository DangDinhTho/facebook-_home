import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/menu_screen.dart';
import 'package:flutter_facebook_responsive_ui/screens/notification_screen.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {  //toàn bộ 6 cái màn hình của ứng dụng
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    NotificationScreen(),
    MenuScreen(),
  ];
  //dưới đây là footer
  final List<IconData> _icons = const [ //6 cái icon tương ứng với 6 cái màn hình của ứng dụng
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline, //nhóm
    MdiIcons.bellOutline, //notification
    Icons.menu,
  ];
  int _selectedIndex = 0; //ban đầu chưa chọn màn hình nào

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;  //lấy kích thước màn hình
    return DefaultTabController(
      length: _icons.length,  //số lượng icon (6)
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(  //trên desktop
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                   onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null, //trên mobile
        body: IndexedStack(
          index: _selectedIndex,//màn hình nào được chọn
          children: _screens, //toàn bộ 6 cái màn hình của ứng dụng
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(  //mobile
                padding: const EdgeInsets.only(bottom: 12.0), //khoang cách từ 6 nút footer tới mép dưới cùng của màn hình điện thoại
                color: Colors.white,  //màu của khung chứa 6 nút
                child: CustomTabBar(
                  icons: _icons,  //toàn bộ 6 icon
                  selectedIndex: _selectedIndex,  //màn hình nào đang hiển thị
                  onTap: (index) => setState(() => _selectedIndex = index), //thay đổi chỉ số màn hình đang hiển thị
                ),
              )
            : const SizedBox.shrink(),  //desktop
      ),
    );
  }
}
