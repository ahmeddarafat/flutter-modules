import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class NativeCodePage extends StatefulWidget {
  const NativeCodePage({super.key});

  @override
  State<NativeCodePage> createState() => _NativeCodePageState();
}

class _NativeCodePageState extends State<NativeCodePage> {
  // static const platform = MethodChannel('samples.flutter.dev/battery');

  // String _batteryLevel = 'Unknown battery level.';

  // Future<void> _getBatteryLevel() async {
  //   String batteryLevel;
  //   try {
  //     final int result = await platform.invokeMethod('getBatteryLevel');
  //     batteryLevel = 'Battery level at $result % .';
  //   } on PlatformException catch (e) {
  //     batteryLevel = "Failed to get battery level: '${e.message}'.";
  //   } on MissingPluginException catch (e) {
  //     batteryLevel = "Failed to get battery level: '${e.message}'.";
  //   }

  //   setState(() {
  //     _batteryLevel = batteryLevel;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                // onPressed: _getBatteryLevel,
                onPressed: () {},
                child: const Text('Get Battery Level'),
              ),
              // Text(_batteryLevel),
              const Text("Battery Level")
            ],
          ),
        ),
      ),
    );
  }
}


/// What I do more

// In android/gradle/wrapper/gradle-wrapper.properties

// covert from  distributionUrl=https\://services.gradle.org/distributions/gradle-7.3-all.zip
//        to    distributionUrl=https\://services.gradle.org/distributions/gradle-6.7.1-all.zip

// - In android/build.gradle

// convert from  classpath 'com.android.tools.build:gradle:7.3.0'
//         to    classpath 'com.android.tools.build:gradle:4.2.1'

// - In android/app/main/kotlin/com/example/flutter_modules/MainActivity.kt

// import androidx.annotation.NonNull
// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.MethodChannel
// import android.content.Context
// import android.content.ContextWrapper
// import android.content.Intent
// import android.content.IntentFilter
// import android.os.BatteryManager
// import android.os.Build.VERSION
// import android.os.Build.VERSION_CODES

// class MainActivity: FlutterActivity() {
//   private val CHANNEL = "samples.flutter.dev/battery"

//   override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//     super.configureFlutterEngine(flutterEngine)
//     MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
//       call, result ->
//         if (call.method == "getBatteryLevel") {
//           val batteryLevel = getBatteryLevel()

//           if (batteryLevel != -1) {
//             result.success(batteryLevel)
//           } else {
//             result.error("UNAVAILABLE", "Battery level not available.", null)
//           }
//         } else {
//           result.notImplemented()
//         }

//     }
//   }

//   private fun getBatteryLevel(): Int {
//   val batteryLevel: Int
//   if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
//     val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
//     batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
//   } else {
//     val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
//     batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
//   }

//   return batteryLevel
// }
// }
