//Flags
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum FlagsImage {
  tr,
  cn,
  br,
  us,
  ua,
  de,
  il,
  ca,
  gb,
  bg,
  fr,
  it,
  ru,
  kr,
  jp,
  pt,
  gr,
  be,
  at,
  hu,
  id,
  ie,
  // ignore: constant_identifier_names
  IN,
  lt,
  lv,
  eg,
  hk,
  ch,
  ma,
  mx,
  ae,
  ar,
  au,
  my,
  ng,
  nl,
  no,
  nz,
  ph,
  pl,
  ro,
  rs,
  sa,
  se,
  sg,
  co,
  cu,
  cz,
  si,
  sk,
  th,
  tw,
  ve,
  za
}

extension GetSvgImage on FlagsImage {
  toSvgImageWidget({double? height}) {
    return SvgPicture.asset(
      fit: BoxFit.fill,
      "assets/images/flags/${name.toLowerCase()}.svg",
      alignment: Alignment.topCenter,
      height: height,
    );
  }
}
