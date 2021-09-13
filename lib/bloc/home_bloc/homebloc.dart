import 'dart:async';

import 'package:facebookui/models/post_model.dart';
import 'package:facebookui/models/story_model.dart';
import 'package:facebookui/models/testmodels.dart';
import 'package:facebookui/models/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homestates.dart';

class HomeBloc extends Cubit<HomeStats> {
  HomeBloc() : super(intstate());
  static HomeBloc get(context) => BlocProvider.of(context);
  List<StoryModel> localStories = [];
  List<UserModel> localUsers = [];
  List<PostModel> localPosts = [];
  void getData() {
    emit(loadingstate());
    Timer(const Duration(seconds: 5), () {
      localStories = stories;
      localUsers = users;
      localPosts = Posts;
      emit(getdatastate());
    });
  }
}
