import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:flutter/material.dart';

void showRoundedDialog(BuildContext context, width, String title,
    String messege, String actionButttonText, VoidCallback buttonAction) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Color.fromARGB(105, 103, 103, 103),
        surfaceTintColor: lighTraansparantColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sizedBox(0.0, width * 0.08),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  messege,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              sizedBox(0.0, 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    surfaceTintColor: backgroundColor),
                onPressed: buttonAction,
                child: Text(
                  actionButttonText,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
