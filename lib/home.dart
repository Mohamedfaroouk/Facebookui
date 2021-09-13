import 'package:facebookui/Layout/web_layout/web_appbar.dart';
import 'package:facebookui/Layout/web_layout/web_home_layout.dart';
import 'package:facebookui/resposive/responsive.dart';
import 'package:facebookui/shared/constants.dart';
import 'package:facebookui/shared/widgets/mytext.dart';
import 'package:facebookui/modules/posts/Post.dart';
import 'package:facebookui/modules/stories/stories_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Layout/mobile_layout/mobile_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.Builder(
        context: context,
        mobilelayout: MobileHome(tabController: _tabController),
        webLayout: WebLayout(tabController: _tabController!));
  }
}

class appbarIcons extends StatelessWidget {
  appbarIcons({Key? key, required this.icon, this.size = 50}) : super(key: key);
  IconData? icon;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: IconButton(
        padding: EdgeInsets.all(15.sp),
        iconSize: size!.sp,
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
