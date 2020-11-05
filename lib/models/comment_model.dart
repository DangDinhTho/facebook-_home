import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:meta/meta.dart';

class Comment {
  final User user;
  final String content;
  final String time;

  const Comment({
    @required this.user,
    @required this.content,
    @required this.time
  });
}