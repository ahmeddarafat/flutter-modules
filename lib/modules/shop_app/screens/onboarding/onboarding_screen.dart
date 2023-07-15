import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/login_screen.dart';

class BoardingModel {
  final String imageUrl;
  final String title;
  final String text;

  BoardingModel(
      {required this.imageUrl, required this.title, required this.text});
}

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  List<BoardingModel> boarding = [
    BoardingModel(
        imageUrl: 'assets/images/images.jpg',
        title: 'title 1 ',
        text: 'text 1'),
    BoardingModel(
        imageUrl: 'assets/images/images.jpg',
        title: 'title 2 ',
        text: 'text 2'),
    BoardingModel(
        imageUrl: 'assets/images/images.jpg',
        title: 'title 3 ',
        text: 'text 3'),
  ];
  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => navigateAndReplaceTo(context, const LoginScreen()),
            child: const Text('SKIP'),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
                itemBuilder: (context, index) => pageItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    expansionFactor: 3,
                  ),
                  controller: boardController,
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                    child: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (isLast) {
                        navigateAndReplaceTo(context, const LoginScreen());
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget pageItem(BoardingModel model) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image(
            image: AssetImage(model.imageUrl),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.text,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
