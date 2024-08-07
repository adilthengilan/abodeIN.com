import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final List <Color> color;
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: width * 0.87,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,colors: color,
          ),
            // colors: [
              // Replace these with your desired gradient colors (use Color objects)
              // const Color(0xfff78ca0), // #f78ca0 (example)
              // const Color(0xfff9748f), // #f9748f (example)
            // ],),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 0,
                color: greyShadeDark
                // color: darktheme
                //     ? Color.fromARGB(255, 165, 223, 254)
                //     : Color.fromARGB(255, 248, 248, 248),
                ),
          ],
        ),
        child: Center(
          child: Text(text, style: buttonTextStyle),
        ),
      ),
    );
  }
}
class AppDragButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const AppDragButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.fromLTRB(250, 700, 10, 20),
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 214, 212, 212)),
          child: Row(
            children: [
              //       widget to be dragged____________________________________
              Draggable(
                axis: Axis.horizontal,
                feedback: Container(
                  // feedback > the widget that actually gets dragged
                  margin: EdgeInsets.only(left: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                ),
                childWhenDragging: Container(
                  height: 45,
                  width: 45,
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.9),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                onDragEnd: (details) {
                  onPressed;
                },
              ),

              sizedBox(height, width * 0.04),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16,
                color: greyShadeLight,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16,
                color: greyShadeMedium,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
