import 'package:facebookui/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconRecat extends StatelessWidget {
  const IconRecat({
    Key? key,
    required this.showicon,
    required this.controller,
    required this.reacturl,
    required this.size,
    required this.intervalBegin,
    required this.intervalEnd,
    required this.ontap,
  }) : super(key: key);

  final bool showicon;
  final String reacturl;
  final double size;
  final double intervalBegin;
  final double intervalEnd;
  final AnimationController controller;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(CurvedAnimation(
              parent: controller,
              curve: Interval(intervalBegin, intervalEnd,
                  curve: Curves.bounceInOut),
            )),
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: showicon
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 107.w * size,
                height: 107.h * size,
                child: ResponsiveAssetImg(reacturl))
            : const SizedBox(),
      ),
    );
  }
}

class ReactContainer extends StatelessWidget {
  const ReactContainer({
    Key? key,
    required this.pressed,
  }) : super(key: key);

  final bool pressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 150.h,
      bottom: 165.h,
      child: Padding(
        padding: EdgeInsets.only(left: 40.w),
        child: AnimatedCrossFade(
            firstChild: SizedBox(
              width: 100.w,
            ),
            secondChild: PhysicalModel(
              shape: BoxShape.circle,
              elevation: 30,
              color: Colors.transparent,
              shadowColor: Colors.grey,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 908.w,
                height: 140.h,
              ),
            ),
            crossFadeState:
                pressed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200)),
      ),
    );
  }
}
