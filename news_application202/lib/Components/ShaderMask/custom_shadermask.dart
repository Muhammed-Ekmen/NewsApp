import 'package:flutter/material.dart';
import 'package:news_application202/Utilities/image/app_image_asset.dart';

class CustomLoginShaderMask extends StatelessWidget {
  const CustomLoginShaderMask({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Colors.black45, Colors.black54],
          end: Alignment.center,
          begin: Alignment.topCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: _boxDecoration(),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
        fit: BoxFit.cover,
        image: ImageName.news.toImageProviderWidget(imageExtension: "png"),
      ),
    );
  }
}
