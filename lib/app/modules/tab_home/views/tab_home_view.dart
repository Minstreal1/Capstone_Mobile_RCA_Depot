import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/routes/app_pages.dart';
import '../../../../app/base/base_common.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';
import '../../../../app/resource/util_common.dart';

import '../controllers/tab_home_controller.dart';

class TabHomeView extends GetView<TabHomeController> {
  const TabHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBoxConst.size(context: context, size: 10),
          _headerWelcome(context),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CALENDAR_DETAIL);
                        },
                        child: Container(
                          decoration: UtilCommon.shadowBox(context,
                              colorBg: Colors.amber),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Icon(
                                Icons.create,
                                size: UtilsReponsive.height(70, context),
                              )),
                              Expanded(
                                  child: TextConstant.titleH3(context,
                                      text: 'Tạo đơn'))
                            ],
                          ),
                        ),
                      )),
                      SizedBoxConst.sizeWith(context: context),
                      Expanded(
                          child: Container(
                        decoration:
                            UtilCommon.shadowBox(context, colorBg: Colors.blue),
                        child: Column(
                          children: [
                            Expanded(
                                child: Icon(
                              Icons.summarize,
                              size: UtilsReponsive.height(70, context),
                            )),
                            Expanded(
                                child: TextConstant.titleH3(context,
                                    text: 'Thống kê'))
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBoxConst.size(context: context),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.TAB_HISTORY);
                        },
                        child: Container(
                          decoration: UtilCommon.shadowBox(context,
                              colorBg: Colors.green),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Icon(
                                Icons.history,
                                size: UtilsReponsive.height(70, context),
                              )),
                              Expanded(
                                  child: TextConstant.titleH3(context,
                                      text: 'Lịch sử'))
                            ],
                          ),
                        ),
                      )),
                      SizedBoxConst.sizeWith(context: context),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.MANAGE_MATERIAL);
                              },
                              child: Container(
                                decoration: UtilCommon.shadowBox(context,
                                    colorBg: Colors.red),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Icon(
                                      Icons.dashboard_customize_rounded,
                                      size: UtilsReponsive.height(70, context),
                                    )),
                                    Expanded(
                                        child: TextConstant.titleH3(context,
                                            text: 'Quản lý rác'))
                                  ],
                                ),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }

  SizedBox _headerWelcome(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(50, context),
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: UtilsReponsive.width(5, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: UtilsReponsive.height(40, context),
              width: UtilsReponsive.height(40, context),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/rca_logo.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBoxConst.sizeWith(context: context),
            TextConstant.subTile3(context,
                fontWeight: FontWeight.bold,
                text:
                    'Xin chào,\n${BaseCommon.instance.accountSession?.lastName}',
                color: ColorsManager.primary),
          ],
        ),
      ),
    );
  }
}
