import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class BottomSheetImpl extends StatelessWidget {
  const BottomSheetImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Learning"),
      ),
      body: Center(
        child: Builder(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _showBottomSheet(context),
                child: const Text("open"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("close"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SecondPage();
                })),
                child: const Text("go"),
              ),
            ],
          );
        }),
      ),
      // bottomSheet: BottomSheet(
      //   builder: (context) {
      //     return Container(
      //       height: 100,
      //       width: double.infinity,
      //       color: Colors.red,
      //     );
      //   },
      //   onClosing: () {
      //     dev.log("bottom sheet closing");
      //   },
      // ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (context) {
        return Container(
          height: 100,
          width: double.infinity,
          color: Colors.yellow,
        );
      },
    );
    // showModalBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Container(
    //       height: 100,
    //       width: double.infinity,
    //       color: Colors.yellow,
    //     );
    //   },
    // );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Second Page")),
    );
  }
}


// TODO: Bottom Sheet
// ---------------------- Bottom Sheet ----------------------
// -----------------------------------------------------------
// [1] It's a small sheet at the bottom of scaffold
// [2] It's not travelling throgh other scaffold
// [3] There are 2 ways for creation
//         1. By passing a Widget to bottomSheet parameter of scaffold Widget
//             - this way make bottom sheet always show
//             - passing BottomSheet Widget or another widget
//         2. By using showBottomSheet, showModalBottomSheet methods
//             - this way make bottom sheet show and hide
// [4] The difference between showBottomSheet, showModalBottomSheet
//       - showBottomSheet: 
//              - It displays the Android bottom sheet just like any other View present
//       - showModalBottomSheet: 
//              - It has an appearance similar to an alert-dialog
// -----------------------------------------------------------

/// 1. BottomSheet Widget

// Scaffold(
//   bottomSheet: BottomSheet(
//     builder: (context){
//       return Container(
//         height: 100,
//         width: double.infinity,
//         color: Colors.red,
//       );
//     },
//     onClosing: (){
//       dev.log("bottom sheet closing");
//     },
//   )
// );

/// 2. showBottomSheet mehtod

void _showBottomSheet(BuildContext context) {
  // First way
  //   - The "context" that passing for of method must be context of widget that
  //     built under the "scaffold" widget in widgets tree
  Scaffold.of(context).showBottomSheet(
    (context) {
      return Container(
        height: 100,
        width: double.infinity,
        color: Colors.yellow,
      );
    },
  );

  // second way
  //   - It's a shorthand for First way
  showBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 100,
        width: double.infinity,
        color: Colors.yellow,
      );
    },
  );
}

/// 3. showModalBottomSheet

void _showModalBottomSheet(BuildContext context) {
  //   - The "context" that passing for of method must be context of widget that
  //     built under the Material widget not necessary "scaffold" in widgets tree
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 100,
        width: double.infinity,
        color: Colors.yellow,
      );
    },
  );
}
