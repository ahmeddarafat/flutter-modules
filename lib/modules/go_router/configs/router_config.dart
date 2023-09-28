import 'package:flutter_modules/modules/go_router/pages/redirect_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/first_page.dart';
import '../pages/second_page.dart';
import '../pages/third_page.dart';

bool condtion = true;
final routerConfig = GoRouter(
  initialLocation: "/first",
  redirect: (context, state) {
    if (condtion) {
      return "/first/redirect";
    }
    return null;
  },
  routes: [
    GoRoute(
      name: "First Page",
      path: '/first',
      builder: (context, state) => const FirstPage(),
      redirect: (context, state) {
        if (condtion) {
          return "/first/redirect";
        }
        return null;
      },
      routes: [
        GoRoute(
          name: "Second Page",
          path: 'second',
          builder: (context, state) => const SecondPage(),
        ),
        GoRoute(
          name: "Third Page",
          path: 'third',
          builder: (context, state) =>
              ThirdPage(userName: state.uri.queryParameters['userName']),
        ),
        GoRoute(
          name: 'Redirect Page',
          path: 'redirect',
          builder: (context, state) {
            return const RedirectPage();
          },
        ),
      ],
    ),
  ],
);
