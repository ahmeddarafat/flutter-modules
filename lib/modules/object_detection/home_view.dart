// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'camera_view.dart';
// //// import 'package:image_picker/image_picker.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   //// late ImagePicker _picker;
//   //// late Stream<XFile?> video;

//   //// void _startVideo() {
//   ////   video = _picker.pickVideo(source: ImageSource.camera).asStream()..listen((event) {
//   ////     log(event?.path.toString() ?? "null");
//   ////   });
//   //// }
//   late CameraController _cameraController;
//   late List<CameraDescription> cameras;

//   void _initCamera() async {
//     cameras = await availableCameras();
//     _cameraController = CameraController(
//       cameras[0],
//       ResolutionPreset.high,
//     );
//     await _cameraController.initialize();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // // _picker = ImagePicker();
//     _initCamera();
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flutter Solution"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
//         child: Center(
//           child: SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) {
//                       return CameraView(cameraController: _cameraController);
//                     },
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(shape: const CircleBorder()),
//               child: Text(
//                 "Start",
//                 style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// /// Draft

// // import 'dart:developer';

// // import 'package:camera/camera.dart';
// // import 'package:flutter/material.dart';

// // late List<CameraDescription> _cameras;

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   _cameras = await availableCameras();
// //   runApp(const CameraApp());
// // }

// // /// CameraApp is the Main Application.
// // class CameraApp extends StatefulWidget {
// //   /// Default Constructor
// //   const CameraApp({Key? key}) : super(key: key);

// //   @override
// //   State<CameraApp> createState() => _CameraAppState();
// // }

// // class _CameraAppState extends State<CameraApp> {
// //   late CameraController controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = CameraController(_cameras[0], ResolutionPreset.max);
// //     controller.initialize().then((_) {
// //       if (!mounted) {
// //         return;
// //       }
// //       setState(() {});
// //     }).catchError((Object e) {
// //       if (e is CameraException) {
// //         switch (e.code) {
// //           case 'CameraAccessDenied':
// //             // Handle access errors here.
// //             break;
// //           default:
// //             // Handle other errors here.
// //             break;
// //         }
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (!controller.value.isInitialized) {
// //       return Container();
// //     }
// //     return MaterialApp(
// //       home: CameraPreview(
// //         controller,
// //         child: Positioned(
// //           bottom: 10,
// //           child: ElevatedButton(
// //             onPressed: () async {
// //             },
// //             child: const Text("Stop"),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }