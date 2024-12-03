import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../../../app/resource/reponsive_utils.dart';
import '../../../app/resource/text_style.dart';

class AppBarCustom extends StatelessWidget {
  final Function callback;
  final String title;
  final Widget? traling;
  AppBarCustom({Key? key, required this.callback, required this.title,this.traling})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: UtilsReponsive.height(20, context),
          right: UtilsReponsive.height(10, context),
          left: UtilsReponsive.height(10, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
                  onTap: () {
                  callback();
                  },
                  child: Icon(Icons.arrow_back_ios_new),
                ),
          TextConstant.titleH2(context,
              text: title, fontWeight: FontWeight.w700),
          traling??const SizedBox.shrink(),
        ],
      ),
    );
  }
}
