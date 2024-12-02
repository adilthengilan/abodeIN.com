import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SmartKey extends StatelessWidget {
  const SmartKey({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<RemoteControllerProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        width: width,
        color: const Color.fromARGB(255, 28, 28, 28),
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.12,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(166, 157, 157, 157),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.012),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.08, width),
            Text(
              "Smart Door Lock",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
            sizedBox(height * 0.01, width),
            Consumer<RemoteControllerProvider>(
              builder: (context, value, child) => Text(
                provider.isLocked ? "Locked" : "UnLocked",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                ),
              ),
            ),
            sizedBox(height * 0.17, width),
            GestureDetector(
              onTap: () {
                provider.toggleLockAction();
              },
              child: Container(
                width: width * 0.27,
                height: height * 0.32,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(97, 224, 224, 224),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Consumer<RemoteControllerProvider>(
                      builder: (context, value, child) => AnimatedPositioned(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                        bottom: provider.isLocked ? 10 : height * 0.17,
                        child: Container(
                          width: width * 0.23,
                          height: height * 0.14,
                          decoration: BoxDecoration(
                            color: provider.isLocked ? Colors.white : Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Icon(
                              provider.isLocked ? Icons.lock : Icons.lock_open,
                              color: provider.isLocked ? const Color.fromARGB(255, 90, 178, 250) : Colors.white,
                              size: 35,
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
      ),
    );
  }
}

class RemoteControllerProvider extends ChangeNotifier {
  bool isLocked = true;

  void toggleLockAction() {
    isLocked = !isLocked;
    notifyListeners(); // Notify listeners about the change
  }
}
