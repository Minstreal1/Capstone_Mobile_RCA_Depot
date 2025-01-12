import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:rca_depot/app/model/depot_information.dart';
import 'package:rca_depot/app/model/voucher.dart';
import 'package:rca_depot/app/modules/check-point/model/draw_money.dart';
import 'package:rca_depot/app/modules/history-checkpoint/model/history_withdraw.dart';
import 'package:rca_depot/app/modules/my-voucher/model/my_voucher.dart';
import 'package:rca_depot/app/modules/personal_info/model/user_information.dart';
import 'package:rca_depot/app/modules/summary/model/summary_dashboard.dart';
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

  Future<List<Voucher>> getVoucher() async {
    return await fetchDataList(
      BaseLink.getVouchers,
      (p0) => Voucher.fromJson(p0),
    );
  }

  Future<List<ScheduleCard>> fetchListScheduleByStatus() async {
    return await fetchDataList(
      '${BaseLink.fetchListScheduleByStatus}',
      (p0) => ScheduleCard.fromJson(p0),
    );
  }

  Future<List<PaymentDetail>> fetchListPayment() async {
    return await fetchDataListWithPost('${BaseLink.fetchListScheduleByStatus}',
        (p0) => PaymentDetail.fromJson(p0),
        body: {});
  }

  Future<ScheduleCard> fetchScheduleById({required int id}) async {
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

  Future<int> createQrPayment({required CreatePaymentPayload payload}) async {
    final response = await http.post(Uri.parse(BaseLink.createQrPayment),
        headers: BaseCommon.instance.headerRequest(),
        body: jsonEncode(payload.toJson()));
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

  Future<ScheduleDetail> fetchDataDetail({required int idSchedule}) async {
    return await fetchDataObject(
      '${BaseLink.scheduleDetailById}?id=$idSchedule',
      (p0) => ScheduleDetail.fromJson(p0),
    );
  }

  Future<PaymentDetail> fetchDataPaymentDetail(
      {required int idSchedule}) async {
    return await fetchDataObject(
      '${BaseLink.paymentDetailByScheduleId}?scheduleId=$idSchedule',
      (p0) => PaymentDetail.fromJson(p0),
    );
  }

  Future<List<MaterialTypeData>> fetchMissingMaterial() async {
    return await fetchDataList(
      BaseLink.fetchListMaterialMissing,
      (p0) => MaterialTypeData.fromJson(p0),
    );
  }

  Future<DepotInformation> fetchOwnDepot({required int id}) async {
    return fetchDataObject(BaseLink.fetchDataOwnDepot + '?id=$id',
        (p0) => DepotInformation.fromJson(p0));
  }

  Future<bool> updateMaterial(
      {required List<MaterialTypeData> listMaterial, bool? updateInit}) async {
    return validationWithPost(BaseLink.updaetMaterial,
        body: {
          "materials": List<dynamic>.from(
              listMaterial.map((x) => x.toJsonUpdate(updateInit)))
        },
        is201: true);
  }

  Future<String> createMoneyLink(int point) async {
    final response = await http.get(
        Uri.parse(BaseLink.createMoneyLink + '?numberPoint=$point'),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${BaseLink.createMoneyLink + '?numberPoint=$point'}');
    log('Body ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["data"];
    }
    throw Exception(json.decode(response.body)['message']);
  }

  Future<void> sendPoint({required int point, required int userId}) async {
    final response = await http.get(
        Uri.parse('${BaseLink.sendPoint}?numberPoint=$point&userId=$userId'),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${'${BaseLink.sendPoint}??numberPoint=$point&userId=$userId'}');
    log('Body ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body)["data"];
    }
    throw Exception(json.decode(response.body)['message']);
  }

  Future<void> fetchSummary() async {
    await fetchDataObject(
      BaseLink.getSummary,
      (p0) {},
    );
  }

  Future<SummaryDashBoard> fetchDashBoard() async {
    return await fetchDataObject(
      BaseLink.getSummary,
      (p0) => SummaryDashBoard.fromJson(p0),
    );
  }

  Future<UserInformation> getPersonal() async {
    return await fetchDataObject(
      BaseLink.getUserInfo,
      (p0) => UserInformation.fromJson(p0),
    );
  }

  Future<bool> updateInformation(
      {required String firstName, required String lastName}) async {
    return await validationWithPost(BaseLink.updateInformation,
        body: {"firstName": firstName, "lastName": lastName});
  }

  Future<List<HistoryWithDraw>> fetchListDrawMoney() async {
    return await fetchDataListWithPost(
        BaseLink.listDrawMoney, (p0) => HistoryWithDraw.fromJson(p0),
        body: {});
  }

  Future<double> fetchPoint() async {
    final response = await http.get(Uri.parse(BaseLink.getPoints),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${BaseLink.getPoints}');
    log('Body ${response.body}');
    if (json.decode(response.body)["status"] == 200) {
      return json.decode(response.body)["data"];
    }
    throw Exception(json.decode(response.body)["message"]);
  }
    Future<bool> createWithDrawMoney({required DrawMoneyPayload payload}) async {
    return await validationWithPost(BaseLink.drawMoney, body: payload.toJson());
  }

 

    Future<bool> takeVoucher({required int id}) async {
    final response = await http.get(
        Uri.parse('${BaseLink.takeVoucher}?voucherId=$id'),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - ${'${BaseLink.takeVoucher}?voucherId=$id'}');
    log('Body ${response.body}');
    if (json.decode(response.body)["status"] == 200) {
      return true;
    }
    throw Exception(json.decode(response.body)['message']);
  }

    Future<List<MyVoucher>> getvoucherByUser() async {
    return await fetchDataList(
      BaseLink.voucherByUser,
      (p0) => MyVoucher.fromJson(p0),
    );
  }
}
