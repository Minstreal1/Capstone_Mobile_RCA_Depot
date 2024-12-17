import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/base/base_common.dart';
import 'package:rca_depot/app/base/base_controller.dart';
import 'package:rca_depot/app/model/depot_information.dart';
import 'package:rca_depot/app/service/main_service.dart';
import '../../../../app/modules/tab_account/model/nav_account.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/routes/app_pages.dart';

class TabAccountController extends BaseController {
  final count = 0.obs;
  List<NavAccount> listNav = [
    NavAccount(
        title: 'Thông tin tài khoản',
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        path: Routes.PERSONAL_INFO,
        textColor: Colors.black,
        backgroundColor: ColorsManager.primary),
    NavAccount(
        title: 'Lịch sử',
        icon: Icon(Icons.history, color: Colors.white),
        path: '',
        textColor: Colors.black,
        backgroundColor: ColorsManager.primary),
    NavAccount(
        title: 'Đổi mật khẩu',
        icon: Icon(Icons.password, color: Colors.white),
        path: '',
        textColor: Colors.black,
        backgroundColor: ColorsManager.primary),
    NavAccount(
        title: 'Đổi điểm',
        icon: Icon(Icons.money, color: Colors.white),
        path: 'path',
        textColor: Colors.black,
        backgroundColor: ColorsManager.primary)
  ];
//  Rx<AccountSession> account = AccountSession().obs;
  Rx<DepotInformation> dataDepot = DepotInformation().obs;

  @override
  void onInit() async {
    fetchData();
    // account.value = BaseCommon.instance.accountSession!;
    // isLoading(false);
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

  fetchData() {
    isLoading(true);
    MainService()
        .fetchOwnDepot(id: BaseCommon.instance.accountSession!.id!)
        .then((dataa) {
      dataDepot(dataa);
      isLoading(true);
    }).catchError(handleError);
  }
}
