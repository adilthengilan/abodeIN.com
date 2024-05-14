// import 'package:flutter/material.dart';
// import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

// class BottomNavigationbar extends StatefulWidget {
//   final String title;
//   const BottomNavigationbar({Key? key, required this.title}) : super(key: key);

//   @override
//   State<BottomNavigationbar> createState() => _BottomNavigationBarState();
// }

// class _BottomNavigationBarState extends State<BottomNavigationbar> {
//   late AnimationController animationController;
//     late Animation<Offset> offsetAnimation;

//     @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//       _offsetAnimation = Tween<Offset>(
//       begin: Offset(0, widget.end),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     ))
//       ..addListener(() {
//         if (mounted) {
//           setState(() {});
//         }
//       });
//     _controller.forward();
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//     );
//   }
// }
