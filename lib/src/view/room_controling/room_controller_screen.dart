import 'package:abodein/src/view/common_Widgets/gradiant_text.dart';
import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/room_controller_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isDarkMode = false;

LinearGradient blueAndRedgradiantColor = LinearGradient(
  begin: Alignment.topCenter,
  colors: [
    Color.fromARGB(255, 82, 8, 134),
    Color.fromARGB(255, 196, 10, 41),
  ],
);

class RoomController extends StatefulWidget {
  const RoomController({super.key});

  @override
  State<RoomController> createState() => _RoomControllerState();
}

class _RoomControllerState extends State<RoomController> {
  @override
  Widget build(BuildContext context) {
    final deviceController =
        Provider.of<RoomControllerProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBox(height * 0.056, width),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: transparantColor,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Text(
              deviceController.isDoorLocked ? "Locked" : "Unlocked",
              style: isDarkMode ? whiteLargeTextStyle : largeTextStyle,
            ),
            sizedBox(height * 0.08, width),
            Consumer<RoomControllerProvider>(
              builder: (context, device, child) =>
                  RoundDeviceGradiantButtonWidget(
                height: height,
                width: width,
                onTap: () {
                  device.DeviceLockUnlockController();
                },
                isPressed: device.isDoorLocked,
                miniButton: false,
                iconData: Icons.power_settings_new,
              ),
            ),
            sizedBox(height * 0.24, 0.0),
            roundRectangleBoxButtons(height, width),
          ],
        ),
      ),
    );
  }

  Widget roundRectangleBoxButtons(height, width) {
    final deviceController = Provider.of<RoomControllerProvider>(context, listen: false);
    return SizedBox(
      width: width,
      height: height * 0.215,
      child: Consumer<RoomControllerProvider>(
        builder: (context, device, child) => 
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: 10,
          ),
          itemBuilder: (context, index) {
            IconData iconData = Icons.circle;
            String content = "";
            bool isPressed = false;
            VoidCallback onPressed = () {};
            switch (index) {
              case 0:
                iconData = Icons.dark_mode_outlined;
                content = 'Quite Time';
                isPressed = deviceController.isDoNotDisturb;
                onPressed = () {
                  device.isDoNotDisturbController();
                };
              case 1:
                iconData = Icons.security_outlined;
                content = 'Safe Mode';
                isPressed = device.isSafeMode;
                onPressed = () {
                  device.isSafeModeController();
                };
                break;
              default:
            }
            return Padding(
              padding: EdgeInsets.only(right: width * 0.17),
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  width: width * 0.33,
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                    right: width * 0.02,
                    top: height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    gradient: isPressed
                        // Linear Gradiant ======================= Box Button ============================================================
                        ? LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          )
                        : LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 255, 251, 254),
                              Color.fromARGB(255, 249, 248, 255),
                            ],
                          ),
                    boxShadow: [
                      isPressed
                          // Box Shadow ================= Box Button =======================================================================
                          ? BoxShadow(
                              color: Color.fromARGB(255, 235, 235, 235),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(0.0, 1.5),
                              blurStyle: BlurStyle.outer,
                            )
                          : BoxShadow(
                              color: Color.fromARGB(255, 231, 231, 231),
                              blurRadius: 6,
                              offset: Offset(0.0, -2),
                              spreadRadius: 2,
                              blurStyle: BlurStyle.inner,
                            ),
                      BoxShadow(
                        color: Color.fromARGB(255, 144, 144, 144),
                        offset: Offset(0, 0.1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      RoundDeviceGradiantButtonWidget(
                        height: height,
                        width: width,
                        onTap: onPressed,
                        isPressed: isPressed,
                        miniButton: true,
                        iconData: iconData,
                      ),
                      sizedBox(height * 0.02, 0.0),
                      GradientText(
                        content,
                        gradient: isPressed
                            ? LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black,
                                ],
                              )
                            : blueAndRedgradiantColor,
                        style: whiteSmallTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RoundDeviceGradiantButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final bool isPressed;
  final bool miniButton;
  final IconData iconData;
  const RoundDeviceGradiantButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
    required this.isPressed,
    required this.miniButton,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: miniButton ? height * 0.1 : height * 0.23,
      width: miniButton ? width * 0.2 : width * 0.45,
      padding: EdgeInsets.all(miniButton ? 6 : 12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: blueAndRedgradiantColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 211, 211, 211),
            spreadRadius: miniButton ? 3 : 4,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          padding: isPressed
              ? EdgeInsets.all(0)
              : EdgeInsets.only(
                  top: miniButton ? 4 : 10,
                  left: miniButton ? 4 : 6,
                  right: miniButton ? 4 : 6,
                  bottom: miniButton ? 3 : 8,
                ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 237, 237, 237),
                Color.fromARGB(255, 220, 220, 220),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isPressed
                  ? LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 255, 247, 247),
                        Colors.white,
                      ],
                    ),
              boxShadow: [
                isPressed
                    ? BoxShadow(
                        color: Color.fromARGB(255, 205, 205, 205),
                        offset: Offset(1, miniButton ? 2 : 4),
                      )
                    : BoxShadow(
                        offset: Offset(0, 0),
                      ),
              ],
            ),
            child: AppIcon(
              iconData: iconData,
              color: Colors.grey,
              height: miniButton ? height * 0.045 : height * 0.13,
            ),
          ),
        ),
      ),
    );
  }
}
