import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/modules/tab_account/model/nav_account.dart';
import '../../../../app/resource/color_manager.dart';
import '../../../../app/routes/app_pages.dart';

class TabAccountController extends GetxController {
  
  final count = 0.obs;
  List<NavAccount> listNav = [
    NavAccount(title: 'Thông tin tài khoản', icon: Icon(Icons.person, color: Colors.white,), path: Routes.PERSONAL_INFO, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Lịch sử', icon: Icon(Icons.history,color: Colors.white), path: '', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Đổi mật khẩu', icon: Icon(Icons.password,color: Colors.white), path: '', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Đổi điểm', icon: Icon(Icons.money, color: Colors.white), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)
  ];
//  Rx<AccountSession> account = AccountSession().obs;
  @override
  Future<void> onInit() async {
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
  
  }