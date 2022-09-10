import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application202/Components/Buttons/custom_button.dart';
import 'package:news_application202/Constants/texts.dart';
import 'package:news_application202/Models/model_of_articles.dart';
import 'package:news_application202/Screens/Launcher/controller/launcher_controller.dart';
import 'package:news_application202/Utilities/app_borderradius.dart';
import 'package:news_application202/Utilities/app_colors.dart';
import 'package:news_application202/Utilities/image/app_image_asset.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  final LauncherController _launcherController = Get.find<LauncherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _launcherController.loadingStatue.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: _headLinePlaceHolder(
                      _launcherController.modelOfNews.value?.articles,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _titlePlaceHolder(context),
                  ),
                  Expanded(
                    flex: 6,
                    child: _newsCardPlaceHolder(
                        _launcherController.modelOfNews.value?.articles),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
      ),
    );
  }

  // BIG HEADLINE
  ListWheelScrollView _headLinePlaceHolder(List<Articles>? items) {
    return ListWheelScrollView.useDelegate(
      diameterRatio: 2,
      itemExtent: Get.width / 1.9,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: items?.length ?? 0,
        builder: (context, index) => Stack(
          children: [
            ImageName.fromInternet.toWidgetFromNetwork(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              url: items?[index].urlToImage ?? "",
              height: Get.height,
            ),
            CustomButton(
              text: AppTexts.textOfTrendingNow,
              onPressed: () {
                debugPrint("TILANDI");
              },
            )
          ],
        ),
      ),
    );
  }

  // NEWS CARD
  _newsCardPlaceHolder(List<Articles>? items) {
    return ListView.builder(
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: Get.height / 7,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.colorOfMercury,
                offset: const Offset(20, 20),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
            borderRadius: appBorderRadius,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: ImageName.fromInternet.toWidgetFromNetwork(
                  padding: const EdgeInsets.all(20),
                  url: items?[index].urlToImage ?? "",
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // API description
                      Text(
                        items?[index].description ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 16),
                      ),
                      //API author verilecek
                      Text(
                        "By ${items?[index].author ?? "Unknown"}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //POPULER NEWS   SHOW MORE
  Padding _titlePlaceHolder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppTexts.textOfPopulerNews),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppTexts.textOfShowMore,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.grey),
                ),
              ),
            ],
          ),
          Divider(color: AppColors.colorOfCinder),
        ],
      ),
    );
  }
}
