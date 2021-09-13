import 'package:facebookui/bloc/animationbloc/animationbloc.dart';
import 'package:facebookui/bloc/home_bloc/homebloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimationBloc()),
        BlocProvider(create: (context) => HomeBloc()..getData()),
      ],
      child: OrientationBuilder(builder: (context, orientation) {
        return ScreenUtilInit(
            designSize: orientation == Orientation.landscape
                ? const Size(2340, 1080)
                : const Size(1080, 2340),
            builder: () {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const Home(),
              );
            });
      }),
    );
  }
}
