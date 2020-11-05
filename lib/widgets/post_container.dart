import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/list_comment.dart';
import 'package:flutter_facebook_responsive_ui/widgets/list_like.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      //khung của bài post
      margin: EdgeInsets.symmetric(
        vertical: 5.0, //khoảng cách theo chiều dọc giữa 2 bài post liên tiếp
        horizontal: isDesktop
            ? 5.0
            : 0.0, //khoảng cách theo chiều ngang giữa 2 mép dọc của bài post và các wiget bên cạnh
      ),
      elevation: isDesktop
          ? 1.0
          : 0.0, //chiều cao của mỗi khung bài post  //độ nổi của khung bài post
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0)) //khung của bài post là 1 hình chữ nhật bo cong ở 4 góc
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical:
                8.0), //khoảng cách từ nội dung của bài post đến 2 mép trên dưới của khung post theo chiều dọc
        color: Colors.white, //màu nền của khung post
        child: Column(
          children: [
            //từng bài post 1
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      12.0), //khoảng cách từ 2 mép dọc màn hình đến title và tên người đăng status
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, //title của status theo thứ tự từ trái sang phải, nếu không thì sẽ xuất hiện từ giữa
                children: [
                  _PostHeader(post: post), //Đang dừng ở đây
                  const SizedBox(height: 4.0),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  //phía head của status (chủ thớt, avatar, ngày đăng, các lưa chọn khác, chế độ xem,...)
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //phần head của status theo chiều ngang
        ProfileAvatar(imageUrl: post.user.imageUrl), //avatar
        const SizedBox(width: 8.0), //khoảng cách từ avatar tới tên chủ thớt
        Expanded(
          //Expanded làm việc với Flex/Flexbox layout. Nó là một trong những widget tốt nhất để phân chia không gian giữa các items với nhau
          child: Column(
            //chủ thớt và (thời gian đăng, chế độ xem) được xếp dọc
            crossAxisAlignment:
                CrossAxisAlignment.start, //tên chủ thớt được đặt ở bên trái,
            children: [
              Text(
                post.user.name, //tên chủ thớt
                style: const TextStyle(
                  fontWeight: FontWeight.w600, //độ đậm
                ),
              ),
              Row(
                children: [
                  //thời gian đăng và chế độ xem được xếp ngang
                  Text(
                    '${post.timeAgo} • ', //Thời gian đăng và dấu •
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    //chế độ xem
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          //dấu mở rộng
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  //số lượng like, comment, share của status
  final Post post;

  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //trả về 1 cột, trong 1 cột chứa 3 thành phần nằm ngang: like, cmt, share
      children: [
        Row(
          //
          children: [
            //nút like
            Expanded(
             // width: 80,
              child: FlatButton(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                            4.0), //kích cỡ của hình bao quanh icon like
                        decoration: BoxDecoration(
                          //hình bao quanh icon like
                          color: Palette
                              .facebookBlue, //hình bao quanh icon like có nền xanh
                          shape: BoxShape
                              .circle, //hình bao quanh icon like là hình tròn
                        ),
                        child: const Icon(
                          //icon like
                          Icons.thumb_up,
                          size: 10.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Text(
                        '${post.likes}', //số like
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => ListLike(post: post,)),
                    );
                  }),
            ),
            const SizedBox(width: 40.0), //khoảng cách từ icon like đến số like

            FlatButton(
              child: Text(
                //số lượng comment
                '${post.comments} Comments',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => ListComment(post: post,))
                );
              },
            ),
            const SizedBox(
                width: 15.0), //khoảng cách giữa số comment và số lượt share
            Text(
              //số share
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(), //giống như thẻ <hr>
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0, //kích cỡ của icon like
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            )
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  //tham chiếu chung đến 3 nút like, comment, share của status
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //chia đều 3 khu vực cho 3 nút like, comment, share
      child: Material(
        color: Colors.white, //màu nền của dòng chứa 3 nút
        child: InkWell(
          onTap:
              onTap, //khi ấn vào thì sự kiện onTap sẽ xảy ra (được định nghĩa riêng)
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal:
                    12.0), //khoảng cách từ 2 mép màn hình tới khung chứa icon like
            height: 25.0, //chiều cao của ô chứa nút like
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, //vị trí của nút like là ở giữa (center)
              children: [
                icon, //logo "like"
                const SizedBox(
                    width: 4.0), //khoảng cách giữa logo "like" và chữ "Like"
                Text(label), //chữ "Like"
              ],
            ),
          ),
        ),
      ),
    );
  }
}
