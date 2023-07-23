import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/multi_platform/mobile.dart';
import 'package:flutter_modules/modules/multi_platform/web.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MultiPlatform extends StatelessWidget {
  const MultiPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 1920, name: DESKTOP),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          log("mobile ${ResponsiveBreakpoints.of(context).isMobile}");
          log("web ${ResponsiveBreakpoints.of(context).isDesktop}");
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Multi Platform",
                style: TextStyle(fontSize: 20.sp),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            body: const MobilePage(),
            drawer: ResponsiveBreakpoints.of(context).isDesktop
                ? Drawer(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const MobilePage();
                                  },
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                "mobile",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const WebPage();
                                  },
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                "Web",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
            bottomNavigationBar: ResponsiveBreakpoints.of(context).isMobile
                ? BottomNavigationBar(
                    onTap: (index) {},
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.mobile_friendly),
                        label: "Mobile",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.web),
                        label: "Web",
                      ),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }
}
