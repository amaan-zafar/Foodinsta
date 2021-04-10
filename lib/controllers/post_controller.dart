import 'package:flutter/material.dart';
import 'package:food_insta/repository/products_repo.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:food_insta/models/feed_post.dart';
import 'package:food_insta/models/post_detail.dart';

enum NewPostState { Initial, Loading, Loaded }

class PostController with ChangeNotifier {
  final PostRepository postRepository;
  NewPostState newPostState = NewPostState.Initial;

  PostController(this.postRepository);

  Future<void> createNewPost(CreatePost post) async {
    notifyListeners();
    await postRepository.createPost(post);
  }

  Future<List<FeedPost>> getFeedPosts(String city) async {
    return await postRepository.getFeedPosts(city);
  }

  Future<PostDetail> getPostDetail(String id) async {
    return await postRepository.getPostWithId(id);
  }
}
