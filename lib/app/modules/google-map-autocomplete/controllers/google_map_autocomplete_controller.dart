import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rca_depot/app/modules/google-map-autocomplete/model/data_search_model.dart';
import 'package:rca_depot/app/modules/sign_up/controllers/sign_up_controller.dart';

class GoogleMapAutocompleteController extends GetxController {
  //TODO: Implement GoogleMapAutocompleteController

  GoogleMapAutocompleteController();
  String apiKey = "PWunup1r6WKIVOuEJcS1j9uGxhg5MfPAYF9oySV8";

  RxList<DataSearchModel> listLocation = <DataSearchModel>[].obs;
  TextEditingController textSearchController = TextEditingController(text: '');

  DataSearchModel selectedDataModel = DataSearchModel();
  @override
  void onInit() {
    initalizationData();
    // autocompleteFetchPlace('quan 9').then((onValue){});
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

  initalizationData() {
    if (Get.find<SignUpController>().selectedDataModel.placeId == null) {
      textSearchController.text = '';
    } else {
      textSearchController.text =
          Get.find<SignUpController>().selectedDataModel.description ?? '';
      textSearchController.selection = TextSelection.fromPosition(
        TextPosition(offset: textSearchController.text.length),
      );
    }
  }

  Future<void> autocompleteFetchPlace(String text) async {
    try {
      //PWunup1r6WKIVOuEJcS1j9uGxhg5MfPAYF9oySV8
      var url = Uri.parse(
          "https://rsapi.goong.io/Place/AutoComplete?api_key=${apiKey}&input=${text}");
      final response = await http.get(
        url,
      );
      log(response.body);
      if (response.statusCode.toString() == '200') {
        var dataRespone = jsonDecode(response.body);
        Iterable listData = dataRespone["predictions"];

        final mapData = listData.cast<Map<String, dynamic>>();
        listLocation.value = mapData.map<DataSearchModel>((json) {
          return DataSearchModel.fromJson(json);
        }).toList();
      } else {
        listLocation.value = [];
      }
    } catch (e) {
      log('message: $e');
    }
  }

  Future<void> onSelectedData(
      {required DataSearchModel dataModelSearch}) async {
    selectedDataModel = dataModelSearch;
    getLatLong(selectedDataModel);
  }

  Future<void> getLatLong(DataSearchModel data) async {
    try {
      var url = Uri.parse(
          "https://rsapi.goong.io/Place/Detail?place_id=${data.placeId}&api_key=${apiKey}");
      final response = await http.get(
        url,
      );
      print(response.body);
      if (response.statusCode.toString() == '200') {
        var dataRespone = jsonDecode(response.body);
        data.lat =
            dataRespone["result"]["geometry"]["location"]["lat"].toDouble();

        data.lng =
            dataRespone["result"]["geometry"]["location"]["lng"].toDouble();
        Get.find<SignUpController>().selectedDataModel = data;
        Get.find<SignUpController>().addressController.text = data.description!;
        Get.back();
      } else {}
    } catch (e) {
    } finally {}
  }
}
