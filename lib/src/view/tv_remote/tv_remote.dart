import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TvRemote extends StatelessWidget {
  const TvRemote({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<TvRemoteProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 21, 37),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(255, 22, 21, 37),
              surfaceTintColor: const Color.fromARGB(255, 22, 21, 37),
              floating: false,
              pinned: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Tv Remote",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  sizedBox(height * 0.01, width),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Row(
                      children: [
                        buildRemoteButtonsDecoration(
                          onTap: () {
                            provider.setKeyPadShown(false);
                          },
                          height: height * 0.052,
                          width: width * 0.12,
                          child: const Icon(
                            Icons.gamepad_outlined,
                            color: Colors.white,
                          ),
                        ),
                        sizedBox(0.0, width * 0.01),
                        buildRemoteButtonsDecoration(
                          onTap: () {
                            // Casting Button
                          },
                          height: height * 0.052,
                          width: width * 0.12,
                          child: const Icon(
                            Icons.tv_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        sizedBox(0.0, width * 0.01),
                        buildRemoteButtonsDecoration(
                          onTap: () {
                            provider.setKeyPadShown(true);
                          },
                          height: height * 0.052,
                          width: width * 0.12,
                          child: const Icon(
                            Icons.dialpad_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        buildRemoteButtonsDecoration(
                          onTap: () {
                            // Home Button
                          },
                          height: height * 0.052,
                          width: width * 0.16,
                          child: const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                          ),
                        ),
                        sizedBox(0.0, width * 0.01),
                        buildRemoteButtonsDecoration(
                          onTap: () {},
                          height: height * 0.052,
                          width: width * 0.16,
                          child: const Icon(
                            Icons.power_settings_new_outlined,
                            color: Colors.redAccent,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox(height * 0.04, width),
                  SizedBox(
                    height: height * 0.35,
                    width: width * 0.78,
                    child: Consumer<TvRemoteProvider>(
                      builder: (context, person, child) => person.keyPadShown
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("1",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("2",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("3",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBox(height * 0.025, width),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("4",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("5",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("6",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBox(height * 0.025, width),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("7",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("8",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                            child: Text("9",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ))),
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBox(height * 0.025, width),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                          child: Text(
                                            "Tools",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                          child: Text("0",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                      buildRemoteButtonsDecoration(
                                        height: height * 0.055,
                                        width: width * 0.17,
                                        onTap: () {},
                                        child: Center(
                                          child: Text(
                                            "Guide",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                sizedBox(height * 0.02, width),
                                Stack(
                                  children: [
                                    CustomContainer(
                                      height: height * 0.3,
                                      width: width * 0.65,
                                      color: const Color.fromARGB(255, 24, 24, 24),
                                      borderRadius: BorderRadius.circular(80),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(45 / 360),
                                        child: Padding(
                                          padding: EdgeInsets.all(height * 0.06),
                                          child: CustomContainer(
                                            height: height * 0.18,
                                            width: width * 0.38,
                                            color: const Color.fromARGB(255, 141, 2, 247),
                                            borderRadius: const BorderRadius.all(Radius.circular(65)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.015,
                                      left: width * 0.245,
                                      child: CustomContainer(
                                        height: height * 0.27,
                                        width: width * 0.18,
                                        color: const Color.fromARGB(255, 141, 2, 247),
                                        borderRadius: BorderRadius.circular(40),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  // Arrow UP
                                                },
                                                child: Container(
                                                  width: width,
                                                  padding: EdgeInsets.only(top: height * 0.03),
                                                  child: const Align(
                                                    alignment: Alignment.topCenter,
                                                    child: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  // Arrow Down
                                                },
                                                child: Container(
                                                  width: width,
                                                  padding: EdgeInsets.only(bottom: height * 0.03),
                                                  child: const Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: width * 0.24,
                                      left: height * 0.013,
                                      child: CustomContainer(
                                        height: width * 0.18,
                                        width: height * 0.27,
                                        color: const Color.fromARGB(255, 141, 2, 247),
                                        borderRadius: BorderRadius.circular(40),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  // Left Arrow
                                                },
                                                child: Container(
                                                  height: height,
                                                  padding: EdgeInsets.only(left: width * 0.05),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Icon(
                                                      Icons.keyboard_arrow_left,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            CustomContainer(
                                              height: height,
                                              width: width * 0.18,
                                              color: Colors.grey.shade900,
                                              shape: BoxShape.circle,
                                              child: InkWell(
                                                onTap: () {
                                                  // Ok  Button
                                                },
                                                child: Center(
                                                  child: CustomContainer(
                                                    height: height,
                                                    width: width * 0.14,
                                                    color: const Color.fromARGB(255, 151, 7, 247),
                                                    shape: BoxShape.circle,
                                                    child: Center(
                                                      child: Text(
                                                        "OK",
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  // Right Arrow
                                                },
                                                child: Container(
                                                  height: height,
                                                  padding: EdgeInsets.only(right: width * 0.05),
                                                  child: const Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ),
                  sizedBox(height * 0.035, width),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 1,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: CustomContainer(
                              height: height * 0.25,
                              width: width * 0.18,
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                colors: [
                                  Color.fromARGB(255, 34, 31, 56),
                                  Color.fromARGB(255, 51, 51, 77),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        // Volume Increase
                                      },
                                      child: SizedBox(
                                        width: width,
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "VOL",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        // Volume Minus
                                      },
                                      child: SizedBox(
                                        width: width,
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            buildRemoteButtonsDecoration(
                              onTap: () {
                                // KeyBoard
                              },
                              height: height * 0.055,
                              width: width * 0.15,
                              child: const Icon(
                                Icons.keyboard_alt_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            sizedBox(height * 0.02, 0.0),
                            buildRemoteButtonsDecoration(
                              onTap: () {
                                // Sound Off
                              },
                              height: height * 0.055,
                              width: width * 0.15,
                              child: const Icon(
                                Icons.volume_off_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            sizedBox(height * 0.02, 0.0),
                            buildRemoteButtonsDecoration(
                              onTap: () {
                                // Exit Button
                              },
                              height: height * 0.055,
                              width: width * 0.15,
                              child: const Icon(
                                Icons.exit_to_app_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildRemoteButtonsDecoration(
                              onTap: () {
                                // Add List
                              },
                              height: height * 0.055,
                              width: width * 0.15,
                              child: const Icon(
                                Icons.playlist_add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            sizedBox(height * 0.02, 0.0),
                            buildRemoteButtonsDecoration(
                              onTap: () {
                                // Play Pause
                              },
                              height: height * 0.055,
                              width: width * 0.15,
                              child: const Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 9,
                                    child: Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  Positioned(
                                    left: 6,
                                    child: Icon(
                                      Icons.play_arrow_outlined,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizedBox(height * 0.02, 0.0),
                            buildRemoteButtonsDecoration(
                              onTap: () {
                                // Grid
                              },
                              height: height * 0.055,
                              width: width * 0.15,
                              child: const Icon(
                                Icons.grid_view_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        // Chanel Changing Button
                        Card(
                          elevation: 1,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: CustomContainer(
                              height: height * 0.25,
                              width: width * 0.18,
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                colors: [
                                  Color.fromARGB(255, 34, 31, 56),
                                  Color.fromARGB(255, 51, 51, 77),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        // Volume Up
                                      },
                                      child: SizedBox(
                                        width: width,
                                        child: const Icon(
                                          Icons.keyboard_arrow_up,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "CH",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        // Volume Down
                                      },
                                      child: SizedBox(
                                        width: width,
                                        child: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Youtube | NetFlix | Apple Tv
                  sizedBox(height * 0.05, width),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // Apple Tv
                          },
                          child: CustomContainer(
                            height: height * 0.08,
                            width: width * 0.17,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/prime video logo.png"),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // NetFlix
                          },
                          child: CustomContainer(
                            height: height * 0.08,
                            width: width * 0.17,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/netFlix icon.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // YouTube
                          },
                          child: CustomContainer(
                            height: height * 0.08,
                            width: width * 0.17,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/Apple Tv.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // Apple Tv
                          },
                          child: CustomContainer(
                            height: height * 0.08,
                            width: width * 0.17,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/hotstar logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox(height * 0.06, width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildRemoteButtonsDecoration({
  required height,
  required width,
  required child,
  required onTap,
}) {
  return Card(
    elevation: 1,
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: CustomContainer(
          height: height,
          width: width,
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 34, 31, 56),
              Color.fromARGB(255, 51, 51, 77),
            ],
          ),
          child: child),
    ),
  );
}

class TvRemoteProvider extends ChangeNotifier {
  bool keyPadShown = false;

  void setKeyPadShown(value) {
    keyPadShown = value;
    notifyListeners();
  }
}

class CustomContainer extends StatelessWidget {
  final double height;
  final double? width;
  final Color color;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Border? border;
  final BoxShape shape;
  final DecorationImage? image;
  final Gradient? gradient;

  const CustomContainer({
    Key? key,
    required this.height,
    this.width,
    required this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.child,
    this.border,
    this.shape = BoxShape.rectangle,
    this.image,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        shape: shape,
        image: image,
        border: border,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
