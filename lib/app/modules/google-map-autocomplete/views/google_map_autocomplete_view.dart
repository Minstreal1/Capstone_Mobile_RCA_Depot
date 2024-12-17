import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_depot/app/resource/form_field_widget.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';

import '../controllers/google_map_autocomplete_controller.dart';

class GoogleMapAutocompleteView
    extends GetView<GoogleMapAutocompleteController> {
  const GoogleMapAutocompleteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new)),
            SizedBoxConst.size(context: context, size: 20),
            FormFieldWidget(
              labelText: 'Nhập địa chỉ',
              controllerEditting: controller.textSearchController,
              icon: Icon(Icons.search),
              setValueFunc: (value) {
                controller.autocompleteFetchPlace(value);
              },
              borderColor: Colors.grey,
              radiusBorder: 10,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.listLocation.value.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () async{
                            // Get.back();
                         await controller.onSelectedData(dataModelSearch: controller.listLocation[index]);
                          },
                          leading: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                              '${controller.listLocation[index].structuredFormatting?.mainText}'),
                          subtitle: Text(
                              '${controller.listLocation[index].structuredFormatting?.secondaryText}'),
                        )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
