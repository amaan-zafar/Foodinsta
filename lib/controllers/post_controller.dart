import 'package:flutter/material.dart';
import 'package:food_insta/repository/products_repo.dart';
import 'package:food_insta/models/post.dart';

class PostController with ChangeNotifier {
  final PostRepository postRepository;

  PostController(this.postRepository);

  Future<void> createNewPost(Post post) async {
    notifyListeners();
    await postRepository.createPost(post);
  }
}
