import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Utilities/app_borderradius.dart';

///images
enum ImageName {
  googleLogo,
  news,
  newsWriting,
  newsBackground,
  
  fromInternet,
}

extension GetImage on ImageName {


  // Widget toWidget({
  //   double? height,
  //   double? width,
  //   EdgeInsetsGeometry? padding,
  //   String fileExtension = "png",
  // }) {
  //   return Padding(
  //     padding: padding ?? EdgeInsets.zero,
  //     child: ClipRRect(
  //       borderRadius: appBorderRadius,
  //       child: SizedBox(
  //         height: height ?? Get.height,
  //         width: width,
  //         child: Image.asset("assets/images/$name.$fileExtension"),
  //       ),
  //     ),
  //   );
  // }
  Widget toWidget({
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    String fileExtension = "png",
  }) {
    return Image.asset("assets/images/$name.$fileExtension");
  }
  Widget toWidgetFromNetwork({
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    required String url,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: appBorderRadius,
        child: SizedBox(
          height: height ?? Get.height,
          width: width ?? Get.width,
          child: Image.network(url,fit: BoxFit.fill),
        ),
      ),
    );
  }

  toImageProviderWidget({String imageExtension = "jpg"}) {
    return AssetImage("assets/images/$name.$imageExtension");
  }
}
