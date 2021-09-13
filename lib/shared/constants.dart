import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const Color mainblue = Color(0xFF1878F3);
Image ResponsiveAssetImg(url) =>
    Image.asset(kIsWeb ? "${url}" : "assets/${url}");
ImageProvider ResponsiveAssetImgProvider(url) =>
    AssetImage(kIsWeb ? "${url}" : "assets/${url}");
