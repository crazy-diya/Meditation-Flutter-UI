import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_flutter_ui/utils/app_colors.dart';
import 'package:meditation_app_flutter_ui/utils/app_string.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _feelingTitleList = [
    "Happy",
    "Angry",
    "Anxious",
    "Sleepy",
    "Sad",
    "Irritated"
  ];
  List<String> _feelingImgList = [
    "assets/grinning.png",
    "assets/angry.png",
    "assets/anxious.png",
    "assets/sleepy.png",
    "assets/crying.png",
    "assets/irritated.png",
  ];

  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: [
                _appBarWidget(),
                _containerWidget(),
                _bottomMenuWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customPadding(
      {Widget child,
      EdgeInsets margin =
          const EdgeInsets.only(top: 10, left: 20, right: 20)}) {
    return Container(
      child: child,
      margin: margin,
    );
  }

  Widget _appBarWidget() {
    return customPadding(
        child: Row(
      children: [
        Icon(Icons.menu),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderGrayColors)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search the bes for you!",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        )
      ],
    ));
  }

  Widget _containerWidget() {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 20,
            ),
            customPadding(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome Chi!",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: AppString.normalFontFamily,
                      color: AppColors.primaryColors),
                ),
                Image.asset(
                  "assets/user.png",
                  width: 65,
                  height: 65,
                ),
              ],
            )),
            customPadding(
              child: Text(
                "How are you fealing?",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: AppString.boldFontFamily,
                    color: AppColors.primaryColors),
              ),
            ),

            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 3,
            //   children: [
            //     _feelingWidget(image: "assets/angry.png",title: ""),
            //     _feelingWidget(image: "assets/grinning.png",title: ""),
            //     _feelingWidget(image: "assets/anxious.png",title: ""),
            //     _feelingWidget(image: "assets/crying.png",title: ""),
            //     _feelingWidget(image: "assets/irritated.png",title: ""),
            //     _feelingWidget(image: "assets/angry.png",title: ""),
            //
            //
            //   ],
            // ),

            SizedBox(
              height: 20,
            ),

            Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _feelingTitleList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return _feelingWidget(
                    title: _feelingTitleList[index],
                    image: _feelingImgList[index],
                  );
                },
              ),
            ),
            customPadding(
              child: Text(
                "Let's Explore",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: AppString.boldFontFamily,
                    color: AppColors.primaryColors),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  _exploreWidget(
                    title: "title",
                    decsription: "decsription",
                    bgImage: "assets/bg3.png",
                  ),
                  _exploreWidget(
                    title: "title",
                    decsription: "decsription",
                    bgImage: "assets/bg2.png",
                  ),
                  _exploreWidget(
                    title: "title",
                    decsription: "decsription",
                    bgImage: "assets/bg1.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exploreWidget({String title, String decsription, String bgImage}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          Image.asset(
            bgImage,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: AppString.boldFontFamily),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              decsription,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColors,
                  fontFamily: AppString.normalFontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feelingWidget({String title, String image}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 60,
            width: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: AppString.normalFontFamily,
              color: AppColors.primaryColors,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomMenuWidget() {
    return Container(
      child: Row(
        children: [
          _menuWidget(
            index: 0,
            icon: "assets/home.png",
          ),
          _menuWidget(
            index: 1,
            icon: "assets/disc.png",
          ),
          _menuWidget(
            index: 2,
            icon: "assets/moon.png",
          ),
          _menuWidget(
            index: 3,
            icon: "assets/music.png",
          ),
        ],
      ),
    );
  }

  Widget _menuWidget({String icon, int index}) {
    bool isSelected = selectedMenu == index;
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedMenu = index;
          });
        },
        child: Container(
          padding: EdgeInsets.only(top: 4,bottom: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                color: isSelected
                    ? AppColors.primaryColors
                    : AppColors.borderGrayColors,
                height: 30,
                width: 30,
              ),
              SizedBox(height: 5,),
              Container(
                height: 3,
                width: 15,
                color: isSelected?AppColors.primaryColors:Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
