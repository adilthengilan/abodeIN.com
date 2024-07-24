import 'package:abodein/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessege(messege) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 4,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor:  backgroundColor
  );
}