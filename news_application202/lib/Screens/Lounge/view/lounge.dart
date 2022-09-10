import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Components/Buttons/custom_sliderbutton.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_application202/Constants/paths.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Helper/GoogleSignInManager/singin_manager.dart';
import 'package:news_application202/Utilities/app_colors.dart';
import 'package:news_application202/Utilities/image/app_flags_svg.dart';

class Lounge extends StatelessWidget {
  const Lounge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorOfDarkThatch,
      body: _gridView(),
      floatingActionButton: _fab(),
    );
  }

  FloatingActionButton _fab() {
    return FloatingActionButton(
      backgroundColor: AppColors.colorOfThatch,
      foregroundColor: AppColors.colorOfCinder,
      child: const Icon(Icons.exit_to_app),
      onPressed: () => GoogleSingInManager.logOut(),
    );
  }

  _gridView() {
    return SafeArea(
      child: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return index < FlagsImage.values.length
                ? GestureDetector(
                    onTap: () => _showDialog(context, index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FlagsImage.values[index].toSvgImageWidget(),
                      ),
                    ),
                  )
                : null;
          },
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child:
                FlagsImage.values[index].toSvgImageWidget(height: Get.height),
          ),
          CustomSliderButton(
            label: AppTexts.textOfLoungeSliderLabel,
            action: () {
              Get.offAllNamed(pathOfLauncherPage,
                  arguments: FlagsImage.values[index]);
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.colorOfCinder,
                  size: 64,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
