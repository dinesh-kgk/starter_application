import 'package:chopper/chopper.dart';
import 'package:starter_application/models/post_model.dart';

import '../services/post_api_services.dart';

class PostRepo {
  final PostApiServices _postApiServices = PostApiServices.create();

  deletePost(id) {
    Future<Response> response = _postApiServices.deletePost(id);
    return response;
  }

  getPosts() async {
    Response response = await _postApiServices.getAllPosts();
    List<PostModel> posts =
        (response.body as List).map((e) => PostModel.fromJson(e)).toList();
    return posts;
  }

  specialPost(id) {
    Future<Response> response = _postApiServices.getSpecialPost(id);
    return response;
  }

  setPost(model) {
    Future<Response> response = _postApiServices.sendPost(model);
    return response;
  }

  updatePost(id, model) {
    Future<Response> response = _postApiServices.updatePost(id, model);
    return response;
  }
}
