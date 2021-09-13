import 'package:facebookui/bloc/animationstates.dart';
import 'package:facebookui/resposive/responsive.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationBloc extends Cubit<AnimationStats> {
  AnimationBloc() : super(intstate());
  static AnimationBloc get(context) => BlocProvider.of(context);
  List<double> iconsize = [1, 1, 1, 1, 1, 1];
  int selectedReact = 1;
  void dragIcons(context, DragUpdateDetails dd) {
    double size = 1;
    Responsive.isMobile(context) ? size = 1 : size = 1343.w;

    if (dd.globalPosition.dx >= size + 0 &&
        dd.globalPosition.dx < size + 151.w) {
      selectedReact = 1;
      iconsize = [2, 1, 1, 1, 1, 1];
      emit(ZoomReactState());
    }
    if (dd.globalPosition.dx >= size + 151.w &&
        dd.globalPosition.dx < size + 302.w) {
      iconsize = [1, 2, 1, 1, 1, 1];
      selectedReact = 2;
      emit(ZoomReactState());
    }
    if (dd.globalPosition.dx >= size + 302.w &&
        dd.globalPosition.dx < size + 453.w) {
      iconsize = [1, 1, 2, 1, 1, 1];
      selectedReact = 3;

      emit(ZoomReactState());
    }
    if (dd.globalPosition.dx >= size + 453.w &&
        dd.globalPosition.dx < size + 604.w) {
      selectedReact = 4;
      iconsize = [1, 1, 1, 2, 1, 1];
      emit(ZoomReactState());
    }
    if (dd.globalPosition.dx >= size + 604.w &&
        dd.globalPosition.dx < size + 755.w) {
      iconsize = [1, 1, 1, 1, 2, 1];
      selectedReact = 5;

      emit(ZoomReactState());
    }
    if (dd.globalPosition.dx >= size + 755.w &&
        dd.globalPosition.dx < size + 908.w) {
      iconsize = [1, 1, 1, 1, 1, 2];
      selectedReact = 6;

      emit(ZoomReactState());
    }
  }

  Widget ReactIcon({onpress, required text, required imagUrl}) => TextButton(
        onPressed: onpress ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 50.w, height: 50.h, child: ResponsiveAssetImg(imagUrl)),
            SizedBox(
              width: 5.w,
            ),
            CustomText(
                color: Colors.black54,
                text: "$text",
                fontWeight: FontWeight.w600,
                size: 40.sp),
          ],
        ),
      );
  Widget theReact(int reactno, VoidCallback onpress) {
    switch (reactno) {
      case 2:
        return ReactIcon(
            text: "Love", imagUrl: "icons/love2.png", onpress: onpress);
      case 3:
        return ReactIcon(
            text: "HaHa", imagUrl: "icons/haha2.png", onpress: onpress);
      case 4:
        return ReactIcon(
            text: "Wow", imagUrl: "icons/wow2.png", onpress: onpress);
      case 5:
        return ReactIcon(
            text: "Sad", imagUrl: "icons/sad2.png", onpress: onpress);
      case 6:
        return ReactIcon(
            text: "Angry", imagUrl: "icons/angry2.png", onpress: onpress);
      default:
        return ReactIcon(
            text: "Liked", imagUrl: "icons/ic_like_fill.png", onpress: onpress);
    }
  }
}
