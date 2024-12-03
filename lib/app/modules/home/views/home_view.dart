import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
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
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.miniCenterDocked,
          // floatingActionButton: Container(
          //   height: UtilsReponsive.height(60, context),
          //   width: UtilsReponsive.height(60, context),
          //   decoration: BoxDecoration(shape: BoxShape.circle),
          //   child: FloatingActionButton(
          //       backgroundColor: ColorsManager.primary,
          //       onPressed: () async {},
          //       child: Icon(Icons.add)),
          // ),
          bottomNavigationBar: Obx(() => _bottomNav2(context)),
          body: SafeArea(
            child: Obx(
                () => controller.body.elementAt(controller.indexSelected.value)),
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
