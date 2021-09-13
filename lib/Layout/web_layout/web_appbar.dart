import 'package:facebookui/home.dart';
import 'package:facebookui/models/testmodels.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget WebAppbar(context, {required TabController tabController}) {
  return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 1100.w,
      centerTitle: true,
      title: AppBarTitle(
        tabController: tabController,
      ),
      leading: const AppBarLeading(),
      actions: AppbarActions(context));
}

/* -------------------------------------------------------------------------*/

class AppBarTitle extends StatelessWidget {
  AppBarTitle({Key? key, required this.tabController}) : super(key: key);
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4000.w,
      child: TabBar(
        indicatorColor: mainblue,
        labelPadding: EdgeInsets.symmetric(vertical: 15.h),
        unselectedLabelColor: Colors.grey,
        labelColor: mainblue,
        onTap: (index) {
          print("$index");
        },
        controller: tabController,
        tabs: [
          Icon(
            Icons.home,
            size: 90.sp,
          ),
          Icon(
            Icons.groups_rounded,
            size: 90.sp,
          ),
          Icon(
            Icons.live_tv_outlined,
            size: 90.sp,
          ),
          Icon(
            Icons.notifications_none_outlined,
            size: 90.sp,
          ),
          Icon(
            Icons.menu,
            size: 90.sp,
          ),
        ],
      ),
    );
  }
}

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Image(
            image: ResponsiveAssetImgProvider("icons/logo.ico"),
          ),
        ),
        Container(
          width: 800.w,
          height: 100.h,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                fillColor: Colors.grey[400],
                filled: true,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
      ],
    );
  }
}

List<Widget> AppbarActions(context) {
  return [
    MediaQuery.of(context).size.width > 1000
        ? Row(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: NetworkImage(
                  "${currentUser.profilePic}",
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                  color: Colors.black,
                  text: "Mohamed",
                  fontWeight: FontWeight.w400,
                  size: 60.sp)
            ],
          )
        : const SizedBox(),
    SizedBox(
      width: 80.w,
    ),
    appbarIcons(
      icon: FontAwesomeIcons.th,
      size: 60,
    ),
    SizedBox(
      width: 40.w,
    ),
    appbarIcons(
      icon: FontAwesomeIcons.facebookMessenger,
      size: 60,
    ),
    SizedBox(
      width: 40.w,
    ),
    appbarIcons(
      icon: FontAwesomeIcons.bell,
      size: 60,
    ),
    SizedBox(
      width: 40.w,
    ),
    appbarIcons(
      icon: FontAwesomeIcons.caretDown,
      size: 60,
    ),
    SizedBox(
      width: 40.w,
    ),
  ];
}
