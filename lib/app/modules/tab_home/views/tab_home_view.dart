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
                          child: Container(
                        decoration:
                            UtilCommon.shadowBox(context, colorBg: Colors.red),
                        child: Column(
                          children: [
                            Expanded(
                                child: Icon(
                              Icons.dashboard_customize_rounded,
                              size: UtilsReponsive.height(70, context),
                            )),
                            Expanded(
                                child: TextConstant.titleH3(context,
                                    text: 'Function'))
                          ],
                        ),
                      )),
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

  Widget _cardData(BuildContext context, ScheduleCard schedule) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(15, context)),
              border: Border.all(color: ColorsManager.primary)),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(10, context),
              horizontal: UtilsReponsive.height(10, context)),
          child: Row(
            children: [
              SizedBoxConst.sizeWith(context: context, size: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: ColorsManager.primary,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text: UtilCommon.convertEEEDateTime(
                              schedule.scheduleDate!),
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'ID:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        text: '${schedule.scheduleId!}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Khách hàng:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                        context,
                        text:
                            '${schedule.residentId?.user?.firstName} ${schedule.residentId?.user?.lastName}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Chung cư:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile3(
                        context,
                        text: '${schedule.building?.buildingName}',
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConstant.subTile3(
                        context,
                        text: 'Mô tả các loại:',
                        size: 10,
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      Expanded(
                        child: TextConstant.subTile3(
                          context,
                          text:
                              '${schedule.materialType?.map((element) => element.name).toList().join(', ')}',
                        ),
                      ),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.regisSchdule(schedule.scheduleId!);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: UtilsReponsive.height(30, context),
                          width: UtilsReponsive.height(100, context),
                          decoration: BoxDecoration(
                            color: ColorsManager.primary,
                            borderRadius: BorderRadius.circular(
                                UtilsReponsive.height(8, context)),
                            border: Border.all(color: ColorsManager.primary),
                          ),
                          child: TextConstant.subTile3(context,
                              text: 'Đăng kí nhận', color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          )),
    );
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
              padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal),
                color: ColorsManager.primary,
                shape: BoxShape.circle,
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
