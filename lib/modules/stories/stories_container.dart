import 'package:facebookui/bloc/home_bloc/homebloc.dart';
import 'package:facebookui/bloc/home_bloc/homestates.dart';
import 'package:facebookui/models/story_model.dart';
import 'package:facebookui/models/testmodels.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesContainer extends StatelessWidget {
  const StoriesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 675.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 40.w),
        child: Row(
          children: [
            const CreateStory(),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: BlocConsumer<HomeBloc, HomeStats>(
                  listener: (context, state) {},
                  builder: (context, snapshot) {
                    final bloc = HomeBloc.get(context);
                    return bloc.localStories.isNotEmpty
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: bloc.localStories.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 16.w,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              if (bloc.localStories.isEmpty) {
                                return const SizedBox();
                              }
                              return Storybuilder(
                                model: bloc.localStories[index],
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Storybuilder extends StatelessWidget {
  Storybuilder({Key? key, required this.model}) : super(key: key);
  StoryModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          height: double.infinity,
          width: 275.w,
          child: Image(
            image: NetworkImage(
              "${model.image}",
            ),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.h, left: 35.w, bottom: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.r,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "${model.user!.profilePic}",
                  ),
                  backgroundColor: Colors.black,
                  radius: 44.r,
                ),
              ),
              const Spacer(),
              Container(
                width: 240.w,
                child: CustomText(
                    color: Colors.white,
                    text: "${model.user!.name}",
                    fontWeight: FontWeight.bold,
                    size: 40.sp),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CreateStory extends StatelessWidget {
  const CreateStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(20)),
          height: double.infinity,
          width: 275.w,
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18)),
                  color: Colors.grey,
                ),
                height: 400.h,
                width: 275.w,
                child: Image(
                  image: NetworkImage(
                    "${currentUser.profilePic}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 343.h, bottom: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 44.r,
                  backgroundColor: mainblue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 240.w,
                child: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      color: Colors.black,
                      text: "Create Story",
                      fontWeight: FontWeight.bold,
                      size: 40.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
