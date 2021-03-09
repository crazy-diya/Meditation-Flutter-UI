import 'package:flutter/material.dart';
import 'package:meditation_app_flutter_ui/pages/home/home_page.dart';
import 'package:meditation_app_flutter_ui/utils/app_colors.dart';
import 'package:meditation_app_flutter_ui/utils/app_string.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboardering_model.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<OnBoarderingModel> _onBoarderingList = [
    OnBoarderingModel(
        image: "assets/onboarding1.png",
        description:
            "Find a suitable music for yourself to stay focused more easily",
        title: "Take a deep breath"),
    OnBoarderingModel(
        image: "assets/onboarding2.png",
        description:
            "Find a suitable music for yourself to stay focused more easily",
        title: "Stay Focused"),
  ];

  final controller = PageController();

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      color: selectedIndex==0?AppColors.pinkColors:AppColors.blueColors,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                        color: selectedIndex==0?AppColors.pinkColors:AppColors.blueColors,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: _containerPaginationWidget(),
                  ),
                ),
                _indicatorWidget(),
                _buttonWidget(),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerPaginationWidget() {
    return PageView.builder(
      controller: controller,
        itemCount: _onBoarderingList.length,
        onPageChanged: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        itemBuilder: (context,index){
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_onBoarderingList[index].image),
            SizedBox(height: 40,),
            Text(
              _onBoarderingList[index].title,
              style: TextStyle(
                fontSize: 28,
                fontFamily: AppString.boldFontFamily,
                color: AppColors.primaryColors,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                _onBoarderingList[index].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: AppString.normalFontFamily),
              ),
            ),
          ],
        ),
      );
    });

  }

  Widget _indicatorWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: SmoothPageIndicator(
        controller: controller,
        count: _onBoarderingList.length,
        effect: ExpandingDotsEffect(
          dotHeight: 10,
          spacing: 10,
          dotWidth: 10,
          dotColor: Colors.grey,
          activeDotColor: AppColors.primaryColors
        ),
      ),
    );
  }

  Widget _buttonWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            if(selectedIndex==0){
              controller.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeIn);
            }else{/*
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );*/
              Navigator.of(context).push(MaterialPageRoute(
                builder: (contex) => HomePage()
              ));
            }
          },
          color: AppColors.primaryColors,
          child: Text(
            selectedIndex==0?"Continue":"Let's go" ,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: AppString.boldFontFamily),
          ),
        ),
      ),
    );
  }
}
