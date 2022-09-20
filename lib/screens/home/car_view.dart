import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/icon-text.dart';
import 'package:todo_app/widgets/small_text.dart';

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPage = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 320,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildCarItem(position);
                })),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPage,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            shape: const Border(),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildCarItem(int position) {
    Matrix4 matrix4 = Matrix4.identity();
    if (position == _currentPage.floor()) {
      var currScale = 1 - (_currentPage - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currentPage.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPage - position + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currentPage.floor() - 1) {
      var currScale = 1 - (_currentPage - position) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }

    return Transform(
      transform: matrix4,
      child: Stack(children: [
        Container(
          height: 200,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: position.isEven ? Color(0xFF16235A) : Color(0xFF16235A),
              image: const DecorationImage(
                  image: AssetImage('assets/images/hyundai.jpg'),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 125,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ]),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Lamborghini'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '4.5'),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '500 comments')
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextWidget(
                          icon: Icons.airline_seat_recline_normal_rounded,
                          iconColor: AppColors.iconColor1,
                          text: '5'),
                      IconTextWidget(
                          icon: Icons.bolt,
                          iconColor: AppColors.mainColor,
                          text: '52 hp'),
                      IconTextWidget(
                          icon: Icons.speed,
                          iconColor: AppColors.iconColor2,
                          text: '72km/h'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
