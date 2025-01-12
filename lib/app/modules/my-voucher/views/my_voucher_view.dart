import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/resource/assets_manager.dart';
import '/app/resource/color_manager.dart';
import '/app/resource/reponsive_utils.dart';
import '/app/resource/text_style.dart';
import '/app/resource/util_common.dart';

import '../controllers/my_voucher_controller.dart';

class MyVoucherView extends GetView<MyVoucherController> {
  const MyVoucherView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mã giảm giá'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : controller.listVoucher.value.isEmpty
                  ? Center(
                      child: TextConstant.subTile3(context,
                          text: 'Bạn chưa có mã giảm giá nào'),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.all(8),
                      itemCount: controller.listVoucher.value.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemBuilder: (context, index) => Container(
                        padding: UtilsReponsive.paddingAll(context, padding: 5),
                        clipBehavior: Clip.antiAlias,
                        height: UtilsReponsive.height(80, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorsManager.primary),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: UtilsReponsive.height(80, context),
                              height: UtilsReponsive.height(80, context),
                              decoration: UtilCommon.shadowBox(context),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: '',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(ImageAssets.logo),
                              ),
                            ),
                            SizedBoxConst.sizeWith(context: context),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                        children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${controller.listVoucher[index].voucher!.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: const Color(0xff979797),
                                                fontSize: UtilsReponsive.height(
                                                    14, context)),
                                      ),
                                    ])),
                                TextConstant.subTile3(context,
                                    text:
                                        '${controller.listVoucher[index].voucher!.description}',
                                    fontWeight: FontWeight.w500),
                                SizedBoxConst.size(context: context),
                                TextConstant.subTile3(context,
                                    text:
                                        '${controller.listVoucher[index].voucher!.voucherCode}',
                                    color: ColorsManager.primary,
                                    fontWeight: FontWeight.bold)
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
        ));
  }
}
