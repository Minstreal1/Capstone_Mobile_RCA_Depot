import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rca_depot/app/model/material_type.dart';
import 'package:rca_depot/app/resource/color_manager.dart';
import 'package:rca_depot/app/resource/form_field_widget.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';
import 'package:rca_depot/app/resource/text_style.dart';
import 'package:rca_depot/app/resource/util_common.dart';

import '../controllers/config_material_controller.dart';

class ConfigMaterialView extends GetView<ConfigMaterialController> {
  const ConfigMaterialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant.titleH2(context, text: 'Các loại rác'),
                Obx(() => controller.waiting.value
                    ? CupertinoActivityIndicator()
                    : TextButton(
                        onPressed: () {
                          controller.updateAll();
                        },
                        child: TextConstant.subTile3(context,
                            text: 'Cập nhật nhanh',
                            color: ColorsManager.primary),
                      ))
              ],
            ),
            TextConstant.subTile2(context,
                text: 'Bạn cần cập nhật giá cho các loại rác mới',
                color: Colors.red),
            Obx(() => controller.isLoading.value
                ? CupertinoActivityIndicator()
                : Expanded(
                    child: Obx(
                    () => ListView.separated(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(15, context)),
                      itemCount: controller.listMaterialDataOwner.value.length,
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemBuilder: (context, index) => ItemMaterial(
                        item: controller.listMaterialDataOwner.value[index],
                      ),
                    ),
                  ))),
            // TextConstant.subTile2(context, text: 'Loại rác hiện tại'),
            // Obx(() => controller.isLoading.value
            //     ? CupertinoActivityIndicator()
            //     : Expanded(
            //         child: Obx(
            //         () => ListView.separated(
            //           padding:
            //               EdgeInsets.all(UtilsReponsive.height(15, context)),
            //           itemCount:
            //               controller.dataDepot.value.depotMaterials!.length,
            //           separatorBuilder: (context, index) =>
            //               SizedBoxConst.size(context: context),
            //           itemBuilder: (context, index) => ItemMaterial(
            //             item: controller.dataDepot.value.depotMaterials![index],
            //           ),
            //         ),
            //       )))
          ],
        ),
      ),
    ));
  }
}

class ItemMaterial extends StatefulWidget {
  ItemMaterial({required this.item});
  final MaterialTypeData item;

  @override
  State<ItemMaterial> createState() => _ItemMaterialState(item: item);
}

class _ItemMaterialState extends State<ItemMaterial> {
  _ItemMaterialState({required this.item});
  final MaterialTypeData item;
  bool? isEnable;
  TextEditingController textController = TextEditingController(text: '');
  @override
  void initState() {
    setState(() {
      textController.text = (item.price!+ (item.price! * 0.12)).toStringAsFixed(2);
      isEnable = item.isActive;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UtilCommon.shadowBox(context),
      padding: EdgeInsets.all(UtilsReponsive.height(8, context)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextConstant.subTile3(context, text: item.name!),
                TextConstant.subTile3(context,
                    text: item.description!, color: Colors.grey),
                SizedBoxConst.size(context: context),
                isEnable != null
                    ? TextConstant.subTile3(context,
                        text: 'Giá: ${item.price!} điểm')
                    : FormFieldWidget(
                        padding: 10,
                        controllerEditting: textController,
                        setValueFunc: (v) {},
                        borderColor: ColorsManager.primary,
                        radiusBorder: 10,
                      )
              ],
            ),
          ),
          isEnable != null
              ? CupertinoSwitch(
                  value: isEnable!,
                  onChanged: (value) {},
                )
              : SizedBox()
        ],
      ),
    );
  }
}
