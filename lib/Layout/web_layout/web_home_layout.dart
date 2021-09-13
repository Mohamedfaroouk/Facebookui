import 'package:facebookui/Layout/web_layout/web_appbar.dart';
import 'package:facebookui/bloc/home_bloc/homebloc.dart';
import 'package:facebookui/bloc/home_bloc/homestates.dart';
import 'package:facebookui/models/testmodels.dart';
import 'package:facebookui/modules/posts/Post.dart';
import 'package:facebookui/modules/posts/addpost_container.dart';
import 'package:facebookui/modules/stories/stories_container.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebLayout extends StatelessWidget {
  WebLayout({Key? key, required this.tabController}) : super(key: key);
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2340 * 2, 1080 * 2),
      builder: () {
        //print(2000.w);
        return Scaffold(
          backgroundColor: const Color(0xFFF0F2F5),
          appBar: WebAppbar(context, tabController: tabController),
          body: TabBarView(
            controller: tabController,
            children: [
              Row(
                children: [
                  const LeftPart(),
                  Container(
                    width: 2000.w,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AddPostContainer(),
                          SizedBox(
                            height: 34.h,
                          ),
                          StoriesContainer(),
                          SizedBox(
                            height: 34.h,
                          ),
                          PostBuilder()
                        ],
                      ),
                    ),
                  ),
                  RIghtPart(),
                ],
              ),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

class RIghtPart extends StatelessWidget {
  RIghtPart({
    Key? key,
  }) : super(key: key);
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 550.0.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            CustomText(
                color: Colors.black,
                text: "Contacts",
                fontWeight: FontWeight.w400,
                size: 55.sp),
            SizedBox(
              height: 70.h,
            ),
            Expanded(
              child: BlocConsumer<HomeBloc, HomeStats>(
                  listener: (context, state) {},
                  builder: (context, snapshot) {
                    final bloc = HomeBloc.get(context);
                    return ListView.separated(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: bloc.localUsers.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 100.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        if (bloc.localUsers.isEmpty) {
                          return const SizedBox();
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 55.r,
                              backgroundImage: NetworkImage(
                                "${bloc.localUsers[index].profilePic}",
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            CustomText(
                                color: Colors.black,
                                text: "${bloc.localUsers[index].name}",
                                fontWeight: FontWeight.w400,
                                size: 55.sp)
                          ],
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftPart extends StatelessWidget {
  const LeftPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 50.0.w, top: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 55.r,
                    backgroundImage: NetworkImage(
                      "${currentUser.profilePic}",
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomText(
                      color: Colors.black,
                      text: "Mohamed Farouk",
                      fontWeight: FontWeight.w400,
                      size: 55.sp)
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group,
                    size: 80.sp,
                    color: mainblue,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  CustomText(
                      color: Colors.black,
                      text: "Friends",
                      fontWeight: FontWeight.w400,
                      size: 55.sp)
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.work,
                    size: 80.sp,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  CustomText(
                      color: Colors.black,
                      text: "Jobs",
                      fontWeight: FontWeight.w400,
                      size: 55.sp)
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark,
                    size: 80.sp,
                    color: Colors.purple,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  CustomText(
                      color: Colors.black,
                      text: "Saved",
                      fontWeight: FontWeight.w400,
                      size: 55.sp)
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.store,
                    size: 80.sp,
                    color: mainblue,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  CustomText(
                      color: Colors.black,
                      text: "MarketPlace",
                      fontWeight: FontWeight.w400,
                      size: 55.sp)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
