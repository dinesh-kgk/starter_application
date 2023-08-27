import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/models/post_model.dart';

import '../repositories/post_repo.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo;
  PostBloc({required this.postRepo}) : super(PostInitialState()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        List<PostModel> response = await postRepo.getPosts();
        emit(PostLoadedState(posts: response));
      } catch (error) {
        emit(PostErrorState(error: error.toString()));
      }
    });
  }
}
