import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';
import '../../../../app/routes/app_pages.dart';

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
                TextConstant.titleH1(context, text: 'Welcome Page'),
                SizedBoxConst.size(context: context, size: 20),
                TextConstant.subTile3(context,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
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
}
