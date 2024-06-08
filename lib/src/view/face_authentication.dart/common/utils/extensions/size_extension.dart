
import 'package:abodein/src/view/face_authentication.dart/common/utils/screen_size_util.dart';

extension SizeExtension on num {
  double get sw => ScreenSizeUtil.screenWidth * this;

  double get sh => ScreenSizeUtil.screenHeight * this;
}
