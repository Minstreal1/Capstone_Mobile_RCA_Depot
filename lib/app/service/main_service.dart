import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import '../../app/base/base_api_service.dart';
import '../../app/base/base_common.dart';
import '../../app/base/base_link.dart';
import '../../app/model/create_payment_payload.dart';
import '../../app/model/material_type.dart';
import '../../app/model/payment_detail.dart';
import '../../app/model/schedule_cart.dart';
import 'package:http/http.dart' as http;
import '../../app/model/schedule_detail.dart';
class MainService extends ApiService {
  Future<List<MaterialTypeData>> fetchListMaterial() async {
    return await fetchDataList(
      BaseLink.fetchListMaterial,
      (p0) => MaterialTypeData.fromJson(p0),
    );
  }

  Future<List<ScheduleCard>> fetchListScheduleByStatus() async {
    return await fetchDataList(
      '${BaseLink.fetchListScheduleByStatus}',
      (p0) => ScheduleCard.fromJson(p0),
    );
  }
  Future<List<ScheduleCard>> fetchListScheduleByStatusByUser(
      {String? status}) async {
    return await fetchDataList(
      '${BaseLink.fetchListScheduleByStatus}',
      (p0) => ScheduleCard.fromJson(p0),
    );
  }

    Future<ScheduleCard> fetchScheduleById(
      {required int id}) async {
    return await fetchDataObject(
      '${BaseLink.fetchScheduleById}?id=$id',
      (p0) => ScheduleCard.fromJson(p0),
    );
  }

  Future<bool> regisSchdule({required int idSchedule}) async {
    return validationWithPatch(
        BaseLink.regisSchdule + '?scheduleId=$idSchedule',
        body: {});
  }

  Future<int> createQrPayment(
      {required CreatePaymentPayload payload}) async {
    final response = await http.post(Uri.parse(BaseLink.createQrPayment),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(payload.toJson()));
    log("payload: ${payload.toString()}");
    log('StatusCode ${response.statusCode} - ${BaseLink.createQrPayment}');
    log('Body ${response.body}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body)["data"];
      return data as int;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
      Future<ScheduleDetail> fetchDataDetail(
      {required int idSchedule }) async {
    return await fetchDataObject(
      '${BaseLink.scheduleDetailById}?id=$idSchedule',
      (p0) => ScheduleDetail.fromJson(p0),
    );
  }


  Future<PaymentDetail> fetchDataPaymentDetail(
      {required int idSchedule }) async {
    return await fetchDataObject(
      '${BaseLink.paymentDetailByScheduleId}?scheduleId=$idSchedule',
      (p0) => PaymentDetail.fromJson(p0),
    );
  }
  //
}
