import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:flutter/material.dart';

void showRoundedDialog(BuildContext context, width, String title,
    String messege, String actionButttonText, VoidCallback buttonAction) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  messege,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        surfaceTintColor: backgroundColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                  sizedBox(0.0, 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        surfaceTintColor: backgroundColor),
                    onPressed: buttonAction,
                    child: Text(actionButttonText),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
