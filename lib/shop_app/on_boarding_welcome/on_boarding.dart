import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login_register/register_screen.dart';
import '../models/onboarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  var pageController = PageController();
  List<OnBoardingModel> list = [
    OnBoardingModel(
      image: "assets/family.png",
      header: "This is my shop APP",
      body: "Please feel free to buy anything",
    ),
    OnBoardingModel(
      image: "assets/family.png",
      header: "You can discover alot of products",
      body:
          "once you get comfortable with the process , just confirm it at the end",
    ),
    OnBoardingModel(
      image: "assets/family.png",
      header: "That it , I hope you good shopping",
      body: "Please rate the app if you find it helpful",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: TextButton(
                onPressed: () {
                  pageController.animateToPage(
                    list.length - 1,
                    duration: Duration(
                      milliseconds: 1500,
                    ),
                    curve: Curves.linear,
                  );
                },
                child: Text("Skip >>"),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    OnBoardingItem(context, list, index),
                itemCount: list.length,
                controller: pageController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 120,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 700),
                        curve: Curves.linear,
                      );
                    },
                    controller: pageController,
                    count: list.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.deepOrange,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      activeDotColor: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: Duration(
                          milliseconds: 1500,
                        ),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                      // setState(() {});
                    },
                    child: Icon(Icons.arrow_back_outlined),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: Duration(
                          milliseconds: 1500,
                        ),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                      // setState(() {});
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget OnBoardingItem(context, List<OnBoardingModel> list, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image(
              image: AssetImage(
                list[index].image,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            list[index].header,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Text(list[index].body),
          ),
          if (index == 2)
            Container(
              width: double.infinity,
              height: 60,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  "Start Now !!",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
