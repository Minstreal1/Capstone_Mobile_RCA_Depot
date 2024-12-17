import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/modules/tab_account/controllers/tab_account_controller.dart';
import 'package:rca_depot/app/service/main_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/modules/tab-calendar/controllers/tab_calendar_controller.dart';
import '../../../../app/modules/tab-calendar/views/tab_calendar_view.dart';
import '../../../../app/modules/tab_account/views/tab_account_view.dart';
import '../../../../app/modules/tab_history/controllers/tab_history_controller.dart';
import '../../../../app/modules/tab_history/views/tab_history_view.dart';
import '../../../../app/modules/tab_home/controllers/tab_home_controller.dart';
import '../../../../app/modules/tab_home/views/tab_home_view.dart';

class HomeController extends BaseController {
  RxList<Widget> body = RxList([TabHomeView(), TabAccountView()]);
  final indexSelected = 0.obs;
  TextEditingController pointNum = TextEditingController();
  @override
  void onInit() {
    onTapped(0);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapped(int index) async {
    switch (index) {
      case 0:
        Get.find<TabHomeController>();
        indexSelected(0);
        break;
      case 1:
        break;
      case 2:
        Get.find<TabAccountController>();
        indexSelected(1);
        break;
      default:
    }
  }

  onTapMainButton() async {}
  money() {
    MainService()
        .createMoneyLink(int.tryParse(pointNum.text)!)
        .then((value) async {
      String payment = value;
      if (await canLaunchUrl(Uri.parse(payment))) {
        await launchUrl(Uri.parse(payment),
            mode: LaunchMode.externalApplication);
      }
    }).catchError(handleError);
  }
}
