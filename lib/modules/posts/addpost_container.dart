import 'package:facebookui/models/testmodels.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import '../../shared/widgets/mytext.dart';

class AddPostContainer extends StatelessWidget {
  const AddPostContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 287.h,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 33.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 54.sp,
                  backgroundImage: NetworkImage(
                    "${currentUser.profilePic}",
                  ),
                ),
                SizedBox(
                  width: 22.w,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 93.h,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          hintText: "What is in your mind ?",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PostButton(
                      color: Colors.red,
                      text: "Live",
                      icon: Icons.video_camera_front),
                ),
                VerticalDivider(
                  indent: 20.h,
                  endIndent: 20.h,
                  thickness: 1,
                  width: 0,
                ),
                Expanded(
                  child: PostButton(
                      color: const Color(0xFF89BE4C),
                      text: "Photo",
                      icon: Icons.photo_library_outlined),
                ),
                VerticalDivider(
                  indent: 20.h,
                  endIndent: 20.h,
                  thickness: 1,
                  width: 0,
                ),
                Expanded(
                  child: PostButton(
                      color: const Color(0xFF8F65E1),
                      text: "Room",
                      icon: Icons.video_call),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  PostButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      this.iconsize = 55,
      this.onpress,
      this.longpress,
      this.textsize = 40})
      : super(key: key);
  IconData icon;
  Color color;
  String text;
  double iconsize;
  double textsize;
  VoidCallback? onpress;
  VoidCallback? longpress;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        child: TextButton(
          onPressed: onpress ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: iconsize.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              CustomText(
                  color: Colors.black54,
                  text: "$text",
                  fontWeight: FontWeight.w600,
                  size: textsize.sp),
            ],
          ),
        ));
  }
}
