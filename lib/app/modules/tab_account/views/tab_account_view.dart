import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rca_depot/app/base/base_common.dart';
import 'package:rca_depot/app/resource/util_common.dart';
import '../../../../app/modules/tab_account/model/nav_account.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';
import '../../../../app/resource/text_style.dart';
import '../../../../app/routes/app_pages.dart';

import '../controllers/tab_account_controller.dart';

class TabAccountView extends GetView<TabAccountController> {
  const TabAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBoxConst.size(context: context, size: 20),
                _avatar(context),
                SizedBoxConst.size(context: context),
                TextConstant.titleH2(context, text: 'Nguyễn Văn A'),
               Obx(()=> RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Số điểm:',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: (controller.dataDepot.value.balance??0.0).toStringAsFixed(2),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ]))),
                SizedBoxConst.size(context: context),
                // _dashboard(context),
                Padding(
                  padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
                  child: Column(
                    children: [
                      // _dashboard(context),
                      SizedBoxConst.size(context: context, size: 30),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: controller.listNav.length,
                        separatorBuilder: (context, index) =>
                            SizedBoxConst.size(context: context, size: 20),
                        itemBuilder: (context, index) =>
                            _cardFeature(context, controller.listNav[index]),
                      ),
                      SizedBoxConst.size(context: context, size: 20),
                      GestureDetector(
                          onTap: () async {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            padding: EdgeInsets.symmetric(
                                horizontal: UtilsReponsive.width(10, context),
                                vertical: UtilsReponsive.height(10, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                ),
                                SizedBoxConst.sizeWith(
                                    context: context, size: 20),
                                Expanded(
                                    child: TextConstant.titleH3(context,
                                        color: Colors.red,
                                        text: 'Đăng xuất',
                                        fontWeight: FontWeight.bold)),
                                SizedBox(),
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  GestureDetector _cardFeature(BuildContext context, NavAccount nav) {
    return GestureDetector(
        onTap: () {
          if (nav.path == 'qr_code') {
            Get.dialog(Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  height:  UtilsReponsive.height(300, context),
                  alignment: Alignment.center,
                  decoration: UtilCommon.shadowBox(context,
                      colorSd: ColorsManager.primary),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.close)),
                      ),
                      QrImageView(
                          data: BaseCommon.instance.accessToken!,
                          version: QrVersions.auto,
                          size: UtilsReponsive.height(200, context)),
                    ],
                  ),
                ),
              ),
            ));
          } else {
            Get.toNamed(nav.path);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.primary,
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey,
              ))),
          padding: EdgeInsets.symmetric(
              horizontal: UtilsReponsive.width(10, context),
              vertical: UtilsReponsive.height(10, context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              nav.icon,
              SizedBoxConst.sizeWith(context: context, size: 20),
              Expanded(
                  child: TextConstant.titleH3(context,
                      color: Colors.white,
                      text: nav.title, fontWeight: FontWeight.w500)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ));
  }

  Container _dashboard(BuildContext context) {
    return Container(
      height: UtilsReponsive.height(80, context),
      padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          color: ColorsManager.primary,
          borderRadius:
              BorderRadius.circular(UtilsReponsive.height(15, context))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: _colsValue(context, title: 'Rác nhựa', content: '10kg')),
          Container(
            height: double.infinity,
            width: UtilsReponsive.height(2, context),
            color: Colors.white,
          ),
          Expanded(child: _colsValue(context, title: 'Giấy', content: '10kg')),
          Container(
            height: double.infinity,
            width: UtilsReponsive.height(2, context),
            color: Colors.white,
          ),
          Expanded(child: _colsValue(context, title: 'Khác', content: '10kg')),
        ],
      ),
    );
  }

  Column _colsValue(BuildContext context,
      {required String title, required String content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextConstant.subTile2(context,
            text: title, fontWeight: FontWeight.bold, color: Colors.white),
        TextConstant.titleH2(context,
            text: content, fontWeight: FontWeight.bold, color: Colors.white)
      ],
    );
  }

  SizedBox _avatar(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(90, context),
      width: UtilsReponsive.height(90, context),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: UtilsReponsive.height(90, context),
            width: UtilsReponsive.height(90, context),
            padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
            decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.primary),
                shape: BoxShape.circle),
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: UtilsReponsive.height(80, context),
              width: UtilsReponsive.height(80, context),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: 
                    Image.asset('assets/images/rca_logo.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {},
              child: Container(
                padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ], color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.camera_alt,
                  size: UtilsReponsive.height(14, context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
