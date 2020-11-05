import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/search.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget { //màn hình chính
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar( //logo facebook, logo tìm kiếm (kính lúp) và logo messenger
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(  //logo facebook
            'facebook',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false, //true thì logo "facebook" sẽ nhảy ra giữa
          floating: true, //logo nổi/ chìm
          actions: [
            CircleButton( //kính lúp tìm kiếm
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () {
                print('Search');
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => Search()));
              },
            ),
            CircleButton( //logo messenger
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => {
                print("object")
              },

            ),
          ],
        ),
        SliverToBoxAdapter( //khung đăng status, livestream, photo và room
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(  //create room
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),  //4 tham số là 4 khoảng cách trái, trên, phải, dưới so với 4 widget cạnh nó
          sliver: SliverToBoxAdapter( //hiển thị ra tất cả những người đang online để cho người dùng có thể tạo room chat riêng
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(  //Khung chứa story
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0), //khoảng cách từ viền của story tới viền của khung chứa story
          sliver: SliverToBoxAdapter(
            child: Stories( //Các story
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList( //khung chứa các bài đăng của người dùng
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post); //các bài đăng của người dùng
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
