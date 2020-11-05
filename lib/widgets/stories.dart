import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {  //duyệt tất cả các story trong csdl
          if (index == 0) { //dành vị trí đầu tiên (0) cho chức năng "Add to Story"
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0), //khoảng cách từ "Add to Story" đến viền bên trái của khung chứa Story
              child: _StoryCard(
                isAddStory: true, //bắt buộc phải là true
                currentUser: currentUser, //bên trong ảnh Add to story là người dùng hiện tại
              ),
            );
          }
          final Story story = stories[index - 1]; //vị trí tiếp theo (1) trở đi là hiển thị story của bạn bè
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0), //Khoảng cách giữa 2 story cạnh nhau
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {  //Cụ thể về các story của mọi người
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({
    Key key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ //Mảng chứa các story của tất cả bạn bè
        ClipRRect(  //ảnh story
          borderRadius: BorderRadius.circular(12.0),  //Độ cong của 4 góc chữ nhật của ảnh trong story (ban đầu là 1 hình chữ nhật vuông 4 góc)
          child: CachedNetworkImage(  //hình ảnh trong story
            // imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl, //ban đầu kiểm tra xem ảnh đó có phải là AddStory hay không
            imageUrl: !isAddStory ? story.imageUrl : currentUser.imageUrl,
            //nếu isAddStory == true, (story đầu tiên), thì ảnh story là currentUser.imageUrl (Avatar của người dùng đang đăng nhập)
            //nếu isAddStory == false, (các story tiếp theo trở đi), thì ảnh story là story.imageUrl  (Story của những bạn bè khác)
            height: double.infinity,  //chiều cao của ảnh trong story matchParent với chiều cao của mỗi story
            width: 110.0, //chiều rộng của mỗi ảnh trong story
            fit: BoxFit.cover,//làm cho ảnh trong story vừa khớp với cả story
          ),
        ),
        Container(  //khung chứa story
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,  //khung chứa story hơi xám xám 1 chút
            borderRadius: BorderRadius.circular(12.0),//Độ cong của 4 góc chữ nhật của khung story (ban đầu là 1 hình chữ nhật vuông 4 góc)
            boxShadow: Responsive.isDesktop(context)
                ? const [ //nếu xem trên desktop
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(  //hiện ra logo Add to Story và ảnh trong story chính là avatar
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(  //hình dấu + để add story
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                    onPressed: () => print('Add to Story'),
                  ),
                )
              : ProfileAvatar(  //hiện ra các story của các người khác
                  imageUrl: story.user.imageUrl,
                  hasBorder: !story.isViewed, //chưa xem thì có viền xanh, xem rồi thì không
                ),
        ),
        Positioned(
          bottom: 8.0,  //Vị trí tương đối của chữ trắng bên dưới story so với ảnh trong story
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story' : story.user.name,  //ảnh AddtoStory thì có chữ 'Add to Story' phía dưới, trái lại thì là tên bạn bè đã đăng story
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,  //nếu tên vượt quá maxLines dòng thì sẽ xử lý phụ thuộc vào overflow
            overflow: TextOverflow.ellipsis,  //xử lý khi tên dài tràn ra khỏi story: thêm dấu ... vào sau tên nào dài quá, nếu không chữ sẽ bị cắt bớt đi
          ),
        ),
      ],
    );
  }
}
