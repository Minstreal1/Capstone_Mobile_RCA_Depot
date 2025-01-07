import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';
import '/app/resource/assets_manager.dart';
import '/app/resource/color_manager.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/resource/text_style.dart';
import '/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _avatar(context),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConstant.titleH2(context,
                              text: 'Chào mừng bạn đến với RCA'),
                          TextConstant.subTile3(context,
                              text: 'Ứng dụng trao đổi rác tái chế',
                              color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBoxConst.size(context: context, size: 20),
                Image.asset(ImageAssets.object4),
                SizedBoxConst.size(context: context, size: 20),
              ],
            ),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: context.width),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(ColorsManager.primary),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(14))),
                    child: TextConstant.subTile2(context,
                        text: 'Tiếp tục', color: Colors.white),
                    onPressed: () async {
                      Get.toNamed(Routes.LOGIN);
                    }))
          ],
        ),
      ),
    ));
  }

  SizedBox _avatar(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(80, context),
      width: UtilsReponsive.height(80, context),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: UtilsReponsive.height(90, context),
            width: UtilsReponsive.height(90, context),
            padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 5),
                shape: BoxShape.circle),
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: UtilsReponsive.height(80, context),
              width: UtilsReponsive.height(80, context),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'assets/images/rca_logo.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
