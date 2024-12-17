import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rca_depot/app/resource/color_manager.dart';
import 'package:rca_depot/app/resource/reponsive_utils.dart';
import 'package:rca_depot/app/resource/text_style.dart';
import 'package:rca_depot/app/routes/app_pages.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: UtilsReponsive.height(5,context)),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: double.infinity,
            height: UtilsReponsive.height(70, context),
            child: Column(
              mainAxisSize:MainAxisSize.max,
              children: [
                // Expanded(
                //   child: SizedBox(
                //     width:double.infinity,
                //     child: ElevatedButton(
                //         onPressed: () {
                //         },
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: ColorsManager.primary,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(25),
                //           ),
                //           textStyle: TextStyle(),
                //         ),
                //         child:
                //             Text("Đơn hàng", style: TextStyleConstant.white16Roboto)),
                //   ),
                // ),
               SizedBox(height: 10,),
                  Expanded(
                  child: Container(
                    margin:EdgeInsets.only(bottom: 10),
                    width:double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.HOME);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.primary,
                         shape: RoundedRectangleBorder(
                          
                            borderRadius: BorderRadius.circular(25),
                          ),
                          textStyle: TextStyle(),
                        ),
                        child:
                            TextConstant.subTile3(context,text:"Về trang chủ",color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset('assets/images/booking_success.svg'),
          ),
          SizedBox(
            height: UtilsReponsive.height(20, context),
          ),
          TextConstant.titleH2(context,text:'Nạp tiền thành công ',
             color: ColorsManager.primary),
                SizedBox(
            height: UtilsReponsive.height(20,context),
          ),
        ],
      ),
    );
  }
}
