import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/Utils/style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class VerifyingFaceAuth extends StatefulWidget {
  const VerifyingFaceAuth({
    super.key,
  });

  @override
  State<VerifyingFaceAuth> createState() => _VerifyingFaceAuthState();
}

// late final CameraDescription camera;

class _VerifyingFaceAuthState extends State<VerifyingFaceAuth> {
  // TextEditingController controller = TextEditingController();
  // late CameraController _cameraController;
  // bool flash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: Image.file(File(imagePath)),
                image: AssetImage("assets/images/Verifying photo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, left: 25),
            height: 30,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 45),
            child: Text(
              "Face Authentication",
              style: whitelargeTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 140, left: 25),
            child: Text(
              "Lorem ipsum dolor sit amet",
              style: whiteLightTextStyle,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 135),
              height: 300,
              width: 300,
              child: Image(
                  image: AssetImage(
                "assets/images/scanning.png",
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 670, left: 170),
            child: Text(
              "40%",
              style: whiteSmallTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 700, left: 50),
            child: SizedBox(
              width: 300,
              child: TweenAnimationBuilder<double>(
                builder: (context, value, child) => LinearProgressIndicator(
                  color: Colors.blue,
                  value: value,
                ),
                tween: Tween(begin: 0, end: 0.5),
                duration: Duration(seconds: 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 710, left: 160),
            child: Text(
              "Verifying....",
              style: whiteSmallTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// // A screen that allows users to take a picture using a given camera.
// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({
//     super.key,
//     required this.camera,
//   });

//   final CameraDescription camera;

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a picture')),
//       // You must wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner until the
//       // controller has finished initializing.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise, display a loading indicator.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Provide an onPressed callback.
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;

//             // Attempt to take a picture and get the file `image`
//             // where it was saved.
//             final image = await _controller.takePicture();

//             if (!context.mounted) return;

//             // If the picture was taken, display it on a new screen.
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(
//                   // Pass the automatically generated path to
//                   // the DisplayPictureScreen widget.
//                   imagePath: image.path,
//                 ),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }

// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({super.key, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }