import 'dart:convert';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/booking-payment-status/booking_success.dart';
import 'package:http/http.dart' as http;

class UniService {
  static String code = '';

  static initLink() async {
    final appLinks = AppLinks();

    try {
      log("Url-handling: $appLinks");
      // uniHandler(uri);
    } catch (e) {
      log(e.toString());
    }
    log("Url-handling");
    appLinks.uriLinkStream.listen((uri) async {
      log("link rr: " + uri.toString());
      //  Get.toNamed(Routes.SIGN_UP);

      await uniHandleLink(uri.toString());
    }, onError: (err) {
      log("Link err");
    });
  }

  static uniHandler(Uri? uri) async {
    if (uri == null || uri.queryParameters.isEmpty) return;
    if (uri.path == '/payment-success') {
      Get.to(() => BookingSuccess());
    }
    // Map<String, String> param = uri.queryParameters;
    // String receivedCode = param['code'] ?? '';
    // log("2s2: $receivedCode");
  }

  static uniHandleLink(String url) async {
    try {
      // if (uri == null || uri.queryParameters.isEmpty) return;
      if (url.contains('/payment-success')) {
        Get.to(() => BookingSuccess());
      }
      // if (uri2.path == '/payment-success') {
      //   Get.to(() => BookingSuccess());
      //   await updateAppointment(
      //       uri2.queryParameters['appointmentId'].toString());
      // }
    } catch (e) {}
  }
}
