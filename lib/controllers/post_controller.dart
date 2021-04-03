import 'package:flutter/material.dart';
import 'package:food_insta/repository/products_repo.dart';
import 'package:food_insta/models/post.dart';

enum NewPostState { Initial, Loading, Loaded }

class PostController with ChangeNotifier {
  final PostRepository postRepository;
  NewPostState newPostState = NewPostState.Initial;

  PostController(this.postRepository);

  Future<void> createNewPost(Post post) async {
    notifyListeners();
    await postRepository.createPost(post);
  }
}
