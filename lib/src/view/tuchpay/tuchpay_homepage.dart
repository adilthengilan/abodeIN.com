import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TuchPayHomePage extends StatelessWidget {
  const TuchPayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final tuchpayProvider = Provider.of<TuchPayController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            width: width,
            height: height * 0.24,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 34, 95, 65),
                  Colors.green.shade800,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.02, 0.0),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    "TuchPay",
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 249, 224, 144),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    "Powered by Tuchtrip",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 249, 224, 144),
                      letterSpacing: 2,
                    ),
                  ),
                ),
                sizedBox(height * 0.01, 0.0),
              ],
            ),
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _moneyTransferBuildBox(icon: Icons.qr_code_scanner_outlined, text: "Scan\nwith UPI",height: height,width: width),
                _moneyTransferBuildBox(icon: Icons.account_balance_sharp, text: "To Bank\nAccount",height: height,width: width),
                _moneyTransferBuildBox(icon: Icons.wifi_protected_setup_outlined, text: "Self\nTransfer",height: height,width: width),
              ],
            ),
          ),
          sizedBox(height * 0.02, width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _moneyTransferBuildBox(icon: Icons.alternate_email_rounded, text: "Pay To\nUPI ID",height: height,width: width),
                _moneyTransferBuildBox(icon: Icons.send_to_mobile_outlined, text: "Pay To\nNumber",height: height,width: width),
                _moneyTransferBuildBox(icon: Icons.charging_station_outlined, text: "Mobile\nRecharge",height: height,width: width),
              ],
            ),
          ),
          sizedBox(height * 0.04, width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.023),
            child: Text(
              "Recharge & Pay Bills",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          sizedBox(height * 0.015, width),
          Consumer<TuchPayController>(
            builder: (context, person, child) => Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.02),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rechargeAndPayBillsBuildBox(icon: Icons.lightbulb_outline_sharp, text: "Electricity",height: height,width: width),
                        _rechargeAndPayBillsBuildBox(icon: Icons.tv_sharp, text: "DTH /\nCable Tv",height: height,width: width),
                        _rechargeAndPayBillsBuildBox(icon: Icons.time_to_leave_outlined, text: "FASTag Recharge",height: height,width: width),
                      ],
                    ),
                    sizedBox(height * 0.02, width),
                    Visibility(
                      visible: person.rechargeAndPayBills,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _rechargeAndPayBillsBuildBox(icon: Icons.propane_tank_outlined, text: "Gas\nbooking",height: height,width: width),
                          _rechargeAndPayBillsBuildBox(icon: Icons.tv_sharp, text: "DTH /\nCable Tv",height: height,width: width),
                          _rechargeAndPayBillsBuildBox(icon: Icons.time_to_leave_outlined, text: "Broadband\n/ Landline",height: height,width: width),
                        ],
                      ),
                    ),
                    sizedBox(person.rechargeAndPayBills ? height * 0.02 : 0.0, width),
                    Visibility(
                      visible: person.rechargeAndPayBills,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _rechargeAndPayBillsBuildBox(icon: Icons.phone_android_outlined, text: "Postpaid mobile",height: height,width: width),
                          _rechargeAndPayBillsBuildBox(icon: Icons.credit_card, text: "Credit\ncards",height: height,width: width),
                          SizedBox(height: height * 0.12, width: width * 0.11),
                        ],
                      ),
                    ),
                    sizedBox(person.rechargeAndPayBills ? height * 0.02 : 0.0, width),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          tuchpayProvider.extendTheRechargeBox();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade900,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: width * 0.016, vertical: height * 0.005),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "View all",
                                style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 249, 224, 144)),
                              ),
                              sizedBox(0.0, width * 0.005),
                              Consumer<TuchPayController>(
                                builder: (context, person, child) => Icon(
                                  person.rechargeAndPayBills ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                                  color: const Color.fromARGB(255, 249, 224, 144),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          sizedBox(height * 0.04, width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Text(
              "Manage Your Money",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          sizedBox(height * 0.015, width),
          Column(
            children: List.generate(
              3,
              (index) {
                final onTapListData = [() {}, () {}, () {}];
                final iconListData = [Icons.timelapse_sharp, Icons.history_sharp, Icons.account_balance_sharp];
                final textlistData = ["Check your CIBIL score for free", "See transaction history", "Check bank balance"];
                return InkWell(
                  onTap: onTapListData[index],
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.025),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Row(
                        children: [
                          Icon(iconListData[index], color: Colors.green.shade900),
                          sizedBox(0.0, width * 0.03),
                          Text(textlistData[index], style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
                          const Spacer(),
                          Icon(Icons.keyboard_arrow_right_outlined, color: Colors.green.shade900),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          sizedBox(height * 0.04, width)
        ],
      ),
    );
  }

  Widget _moneyTransferBuildBox({required IconData icon, required String text,required double width, required double height}) {
    return Container(
      width: width * 0.262,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade900, width: 2),
        color: Colors.white,
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 34, 95, 65),
            Colors.green.shade800,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.028, vertical: height * 0.022),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: const Color.fromARGB(255, 209, 184, 103),
            ),
            sizedBox(height * 0.015, 0.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rechargeAndPayBillsBuildBox({required IconData icon, required String text,required double width, required double height}) {
    return Container(
      height: height * 0.12,
      width: width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.green.shade900,
          ),
          sizedBox(height * 0.005, 0.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
class TuchPayController extends ChangeNotifier {
  bool rechargeAndPayBills = false;

  void extendTheRechargeBox() {
    rechargeAndPayBills = !rechargeAndPayBills;
    notifyListeners();
  }
}
