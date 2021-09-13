import 'package:flutter/cupertino.dart';

class Responsive {
  static bool isMobile(context) {
    if (MediaQuery.of(context).size.width < 850) {
      return true;
    } else {
      return false;
    }
  }

  static Widget Builder(
      {required context,
      required Widget mobilelayout,
      required Widget webLayout}) {
    return LayoutBuilder(
        builder: (contex, constrain) =>
            constrain.maxWidth < 850 ? mobilelayout : webLayout);
  }
}
