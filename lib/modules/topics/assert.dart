// ------------- assert --------------
// ------------------------------------
// [1] It's used for testing conditions during debugging/development.
// [2] all asserts are ignored in release/production mode;
// ------------------------------------

import 'package:flutter/material.dart';

class AssertTopic extends StatelessWidget {
  final int num;
  const AssertTopic({super.key, required this.num}) : assert(num > 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(num.toString()),
      ),
    );
  }
}

// home: AssertTopic(num: 1,),
// home: AssertTopic(num: -1,), // Compile-time error: Evaluation of this constant expression throws an exception