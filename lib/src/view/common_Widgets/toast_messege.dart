import 'package:abodein/src/view/room_controling/room_controller_screen.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessege(messege) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 4,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: isDarkMode? backgroundColor : primarycolor
  );
}