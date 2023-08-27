import 'package:flutter/material.dart';
import 'package:starter_application/models/post_model.dart';

@immutable
abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState({required this.posts});
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState({required this.error});
}
