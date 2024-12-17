import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rca_depot/app/resource/form_field_widget.dart';
import 'package:rca_depot/app/resource/text_style.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/resource/reponsive_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
            height: UtilsReponsive.height(60, context),
            width: UtilsReponsive.height(60, context),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: FloatingActionButton(
                backgroundColor: ColorsManager.primary,
                onPressed: () async {
                  
                  Get.bottomSheet(Container(
                      height: UtilsReponsive.height(400, Get.context!),
                      width: double.infinity,
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(15, context)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                UtilsReponsive.height(15, Get.context!)),
                            topRight: Radius.circular(
                                UtilsReponsive.height(15, Get.context!)),
                          ),
                          color: Colors.white),
                      child: Column(children: [
                        TextConstant.subTile2(Get.context!,
                            text: 'Số điểm muốn nạp'),
                             TextConstant.subTile2(Get.context!,
                            text: '1 điểm = 1000VNĐ', color: Colors.grey),
                        SizedBoxConst.size(context: context),
                        FormFieldWidget(
                          controllerEditting: controller.pointNum,
                          setValueFunc: (v) {},
                          radiusBorder: 10,
                          padding: 15,
                          borderColor: ColorsManager.primary,
                        ),
                        SizedBoxConst.size(context: context),
                        OutlinedButton(
                            onPressed: () {
                              controller.money();
                            },
                            child: TextConstant.subTile3(context,
                                text: 'Xác nhận'))
                      ])));
                },
                child: Icon(LineIcons.moneyCheck)),
          ),
          bottomNavigationBar: Obx(() => _bottomNav2(context)),
          body: SafeArea(
            child: Obx(() =>
                controller.body.elementAt(controller.indexSelected.value)),
          )),
    );
  }

  Container _bottomNav2(BuildContext context) {
    return Container(
        // color: Colors.grey.withOpacity(0.1),

        height: UtilsReponsive.height(80, context),
        padding: EdgeInsets.only(bottom: UtilsReponsive.height(15, context)),
        child: BottomNavigationBar(
          // backgroundColor: Colors.grey.withOpacity(0.1),

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: LineIcon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: LineIcon(
                LineIcons.moneyCheck,
                color: Colors.white,
              ),
              label: 'Nạp tiền',
            ),
            BottomNavigationBarItem(
              icon: LineIcon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: controller.indexSelected.value,
          selectedItemColor: ColorsManager.primary,
          selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: UtilsReponsive.height(14, context),
              fontWeight: FontWeight.bold,
              color: Colors.black),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: GoogleFonts.montserrat(
              fontSize: UtilsReponsive.height(12, context),
              fontWeight: FontWeight.w600,
              color: Colors.black),
          showUnselectedLabels: true,
          elevation: 0,
          onTap: (value) async {
            await controller.onTapped(value);
          },
        ));
  }
}
