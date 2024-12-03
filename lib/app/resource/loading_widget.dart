import 'color_manager.dart';
import 'reponsive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
                child: SizedBox(
                  height: UtilsReponsive.height(100, context),
                  width: UtilsReponsive.width(100, context),
                  child: SpinKitFadingCircle(
                    color: ColorsManager.primary, // Màu của nét đứt
                    size: 50.0, // Kích thước của CircularProgressIndicator
                  ),
                ),
              );
  }
}