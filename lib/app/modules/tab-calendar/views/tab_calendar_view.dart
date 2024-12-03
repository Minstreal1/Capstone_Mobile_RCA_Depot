import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/model/schedule_cart.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';
import '../../../../app/resource/util_common.dart';
import '../../../../app/routes/app_pages.dart';

import '../controllers/tab_calendar_controller.dart';

class TabCalendarView extends GetView<TabCalendarController> {
  const TabCalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxConst.size(context: context, size: 10),
              Center(
                child: TextConstant.titleH3(text: 'Lịch thu gom', context),
              ),
              SizedBoxConst.size(context: context, size: 20),
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) =>
                            _cardData(context, controller.listSchedule[index]),
                        separatorBuilder: (context, index) =>
                            SizedBoxConst.size(context: context),
                        itemCount: controller.listSchedule.value.length),
              )
            ],
          )),
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
                              schedule.scheduleDate ?? DateTime.now()),
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
                        text:
                            '${schedule.scheduleId!}',
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
                          Get.toNamed(Routes.CALENDAR_DETAIL, arguments: schedule);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: UtilsReponsive.height(30, context),
                          padding: EdgeInsets.symmetric(horizontal: UtilsReponsive.width(5, context)),
                          // width: UtilsReponsive.height(100, context),
                          decoration: BoxDecoration(
                            color: ColorsManager.primary,
                            borderRadius: BorderRadius.circular(
                                UtilsReponsive.height(8, context)),
                            border: Border.all(color: ColorsManager.primary),
                          ),
                          child: TextConstant.subTile3(context,
                              text: 'Bắt đầu thu gom', color: Colors.white),
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
}
