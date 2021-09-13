import 'package:facebookui/models/usermodel.dart';

class PostModel {
  UserModel? user;
  String? text;
  String? date;
  bool? hasimage;
  bool? liked;
  List<String>? images = [];
  int? reactNo;
  int? likes;
  int? coments;
  int? shares;
  PostModel({
    required this.user,
    required this.text,
    required this.date,
    required this.hasimage,
    required this.liked,
    required this.images,
    required this.reactNo,
    required this.likes,
    required this.coments,
    required this.shares,
  });
}
