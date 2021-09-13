import 'package:auto_direction/auto_direction.dart';
import 'package:facebookui/bloc/animationbloc/animationbloc.dart';
import 'package:facebookui/bloc/animationstates.dart';
import 'package:facebookui/bloc/home_bloc/homebloc.dart';
import 'package:facebookui/bloc/home_bloc/homestates.dart';
import 'package:facebookui/models/post_model.dart';
import 'package:facebookui/models/testmodels.dart';
import 'package:facebookui/modules/posts/addpost_container.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:facebookui/modules/posts/animation_react.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostBuilder extends StatelessWidget {
  const PostBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeStats>(
        listener: (context, state) {},
        builder: (context, snapshot) {
          final bloc = HomeBloc.get(context);
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bloc.localPosts.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 24.h,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Post(
                model: bloc.localPosts[index],
              );
            },
          );
        });
  }
}

class Post extends StatefulWidget {
  Post({Key? key, required this.model}) : super(key: key);
  PostModel model;
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> with SingleTickerProviderStateMixin {
  AnimationController? reactController;
  CarouselSliderController? sliderController = CarouselSliderController();
  bool pressed = false;
  bool showicon = false;

  void OpenReact() {
    setState(() {
      if (!pressed) {
        pressed = !pressed;
        reactController!.forward();
        showicon = true;
      }
    });
  }

  void CloseReact() {
    setState(() {
      if (pressed) {
        pressed = !pressed;
        showicon = false;
        reactController!.reverse();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reactController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    reactController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 34.h, left: 34.w, right: 34.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 54.sp,
                      backgroundImage: NetworkImage(
                        "${widget.model.user!.profilePic}",
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                            color: Colors.black,
                            text: "${widget.model.user!.name}",
                            fontWeight: FontWeight.bold,
                            size: 40.sp),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                                color: Colors.grey,
                                text: "${widget.model.date} • ",
                                fontWeight: FontWeight.normal,
                                size: 40.sp),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: 30.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz,
                      size: 60.sp,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              AutoDirection(
                text: widget.model.text!,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: CustomText(
                      color: Colors.black,
                      text: "${widget.model.text}",
                      fontWeight: FontWeight.w400,
                      size: 40.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (widget.model.hasimage!)
                Container(
                  height: 1200.h,
                  child: GestureDetector(
                      onPanUpdate: (details) {
                        if (kIsWeb && widget.model.images!.length > 1) {
                          if (details.delta.dx > 0) {
                            sliderController!.previousPage();
                          }

                          // Swiping in left direction.
                          if (details.delta.dx < 0) {
                            print("ledt");
                            sliderController!.nextPage();
                          }
                        }
                      },
                      child: CarouselSlider.builder(
                          autoSliderTransitionTime:
                              const Duration(milliseconds: 500),
                          controller: sliderController,
                          slideIndicator: widget.model.images!.length > 1
                              ? CircularSlideIndicator(
                                  padding: const EdgeInsets.only(bottom: 10),
                                )
                              : null,
                          slideBuilder: (index) {
                            return Image(
                              image: NetworkImage(
                                "${widget.model.images![index]}",
                              ),
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: widget.model.images!.length)),
                )
              else
                const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 38.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: mainblue,
                      size: 30.sp,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    CustomText(
                        color: Colors.grey,
                        text: "${widget.model.likes}",
                        fontWeight: FontWeight.normal,
                        size: 36.sp),
                    const Spacer(),
                    CustomText(
                        color: Colors.grey,
                        text: "${widget.model.coments} Comments",
                        fontWeight: FontWeight.normal,
                        size: 36.sp),
                    CustomText(
                        color: Colors.grey,
                        text: " • ",
                        fontWeight: FontWeight.normal,
                        size: 36.sp),
                    CustomText(
                        color: Colors.grey,
                        text: "${widget.model.shares} Share",
                        fontWeight: FontWeight.normal,
                        size: 36.sp),
                  ],
                ),
              ),
              const Divider(
                height: 0,
              ),
              Container(
                height: 120.h,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onLongPress: () {
                          OpenReact();
                        },
                        onHorizontalDragStart: (ss) {
                          OpenReact();
                        },
                        onHorizontalDragEnd: (ss) {
                          AnimationBloc.get(context).iconsize = [
                            1,
                            1,
                            1,
                            1,
                            1,
                            1
                          ];
                          CloseReact();
                          widget.model.reactNo =
                              AnimationBloc.get(context).selectedReact;
                          widget.model.liked = true;
                        },
                        onHorizontalDragUpdate: (dd) {
                          AnimationBloc.get(context).dragIcons(context, dd);
                        },
                        child: widget.model.liked!
                            ? AnimationBloc.get(context)
                                .theReact(widget.model.reactNo!, () {
                                widget.model.liked = false;

                                setState(() {});
                              })
                            : PostButton(
                                onpress: () {
                                  widget.model.reactNo = 1;
                                  widget.model.liked = true;

                                  setState(() {});
                                },
                                color: Colors.grey,
                                text: "Like",
                                icon: Icons.thumb_up_alt_outlined),
                      ),
                    ),
                    Expanded(
                      child: PostButton(
                          color: Colors.grey,
                          text: "Conmment",
                          icon: Icons.comment_outlined),
                    ),
                    Expanded(
                      child: PostButton(
                          color: Colors.grey, text: "Share", icon: Icons.share),
                    ),
                  ],
                ),
              )
            ],
          ),
          ReactContainer(pressed: pressed),
          BlocConsumer<AnimationBloc, AnimationStats>(
              listener: (context, state) {},
              builder: (context, snapshot) {
                final bloc = AnimationBloc.get(context);
                return Positioned(
                  bottom: 1.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Container(
                      width: 908.w,
                      height: 290.h,
                      child: GestureDetector(
                        key: const Key("1"),
                        onHorizontalDragUpdate: (dd) {
                          AnimationBloc.get(context).dragIcons(context, dd);
                        },
                        onHorizontalDragEnd: (ss) {
                          bloc.iconsize = [1, 1, 1, 1, 1, 1];
                          CloseReact();
                          widget.model.reactNo = bloc.selectedReact;
                          widget.model.liked = true;
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconRecat(
                              ontap: () {
                                CloseReact();
                                widget.model.reactNo = 1;
                              },
                              size: bloc.iconsize[0],
                              reacturl: "icons/like.gif",
                              showicon: showicon,
                              controller: reactController!,
                              intervalBegin: 0.0,
                              intervalEnd: 0.16,
                            ),
                            IconRecat(
                              ontap: () {
                                CloseReact();
                                widget.model.reactNo = 2;
                              },
                              size: bloc.iconsize[1],
                              reacturl: "icons/love.gif",
                              showicon: showicon,
                              controller: reactController!,
                              intervalBegin: 0.16,
                              intervalEnd: 0.32,
                            ),
                            IconRecat(
                              ontap: () {
                                CloseReact();
                                widget.model.reactNo = 3;
                              },
                              size: bloc.iconsize[2],
                              reacturl: "icons/haha.gif",
                              showicon: showicon,
                              controller: reactController!,
                              intervalBegin: 0.32,
                              intervalEnd: 0.48,
                            ),
                            IconRecat(
                              ontap: () {
                                CloseReact();
                                widget.model.reactNo = 4;
                              },
                              size: bloc.iconsize[3],
                              reacturl: "icons/wow.gif",
                              showicon: showicon,
                              controller: reactController!,
                              intervalBegin: 0.48,
                              intervalEnd: 0.66,
                            ),
                            IconRecat(
                              ontap: () {
                                CloseReact();
                                widget.model.reactNo = 5;
                              },
                              size: bloc.iconsize[4],
                              reacturl: "icons/sad.gif",
                              showicon: showicon,
                              controller: reactController!,
                              intervalBegin: 0.66,
                              intervalEnd: 0.82,
                            ),
                            IconRecat(
                              ontap: () {
                                CloseReact();
                                widget.model.reactNo = 6;
                              },
                              size: bloc.iconsize[5],
                              reacturl: "icons/angry.gif",
                              showicon: showicon,
                              controller: reactController!,
                              intervalBegin: 0.82,
                              intervalEnd: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
