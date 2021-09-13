import 'package:facebookui/home.dart';
import 'package:facebookui/modules/posts/Post.dart';
import 'package:facebookui/modules/posts/addpost_container.dart';
import 'package:facebookui/modules/stories/stories_container.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverAppBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        floating: true,
                        excludeHeaderSemantics: true,
                        title: CustomText(
                          text: "facebook",
                          fontWeight: FontWeight.bold,
                          color: mainblue,
                          size: 80.sp,
                        ),
                        actions: [
                          appbarIcons(
                            icon: FontAwesomeIcons.search,
                          ),
                          SizedBox(
                            width: 34.w,
                          ),
                          appbarIcons(icon: FontAwesomeIcons.facebookMessenger),
                          SizedBox(
                            width: 34.w,
                          ),
                        ])
                  ],
          body: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  labelPadding: EdgeInsets.symmetric(vertical: 30.h),
                  unselectedLabelColor: Colors.grey,
                  labelColor: mainblue,
                  onTap: (index) {
                    print("$index");
                  },
                  controller: _tabController,
                  tabs: [
                    Icon(
                      Icons.home,
                      size: 60.sp,
                    ),
                    Icon(
                      Icons.groups_rounded,
                      size: 60.sp,
                    ),
                    Icon(
                      Icons.live_tv_outlined,
                      size: 60.sp,
                    ),
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 60.sp,
                    ),
                    Icon(
                      Icons.menu,
                      size: 60.sp,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const AddPostContainer(),
                          SizedBox(
                            height: 34.h,
                          ),
                          const StoriesContainer(),
                          SizedBox(
                            height: 34.h,
                          ),
                          const PostBuilder()
                        ],
                      ),
                    ),
                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
