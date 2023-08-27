import 'package:chopper/chopper.dart';
import 'package:starter_application/chopper/chopperclient.dart';
import 'package:starter_application/chopper/jsonconverter.dart';

import '../models/post_model.dart';
part 'post_api_services.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiServices extends ChopperService {
  // get all posts from server
  @Get()
  Future<Response> getAllPosts();

  // get special post from server
  @Get(path: '/{id}')
  Future<Response> getSpecialPost(@Path() int id);

  // send post to server
  @Post()
  Future<Response> sendPost(@Body() Map<String, dynamic> data);

  // delete post from server
  @Delete(path: '/{id}')
  Future<Response> deletePost(@Path() int id);

  // update post
  @Put(path: '/{id}')
  Future<Response> updatePost(
      @Path() int id, @Body() Map<String, dynamic> data);

  // make request to server and create instance from this abstract class
  static PostApiServices create() {
    return _$PostApiServices(ChopperSingleton.getClient());
  }
}
