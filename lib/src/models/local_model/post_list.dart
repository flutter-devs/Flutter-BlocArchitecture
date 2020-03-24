import 'package:flutter_bloc_architecture/src/models/local_model/post.dart';

class PostList {
  final List<Post> posts;

  PostList({
    this.posts,
  });

  factory PostList.fromJson(List<dynamic> json) {
    List<Post> posts = List<Post>();
    posts = json.map((post) => Post.fromMap(post)).toList();

    return PostList(
      posts: posts,
    );
  }
}
