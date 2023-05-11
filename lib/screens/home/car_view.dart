import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/models/product_models.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/constants.dart';
import 'package:todo_app/utilis/dimensions.dart';
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
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.carView;

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
        // slider container
        GetBuilder<ProductControllers>(
          builder: (popularProducts) {
            return SizedBox(
                height: Dimensions.carViewContainer,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.repoList.length,
                    itemBuilder: (context, position) {
                      return _buildCarItem(
                          position, popularProducts.repoList[position]);
                    }));
          },
        ),
        // Dots Indicator
        GetBuilder<ProductControllers>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.repoList.isEmpty
                ? 1
                : popularProducts.repoList.length,
            position: _currentPage,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              shape: const Border(),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BigText(text: 'Recommended'),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: BigText(
                text: '.',
                color: Colors.black26,
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 1),
              child: SmallText(
                text: 'Food Pairing',
              ),
            ),
          ]),
        ),

        SizedBox(
          height: Dimensions.height20,
        ),

        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    Container(
                      height: Dimensions.listViewImg,
                      width: Dimensions.listViewImg,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/hyundai.jpg'))),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewText,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "2023 Lamborghini RX Review"),
                              SizedBox(height: Dimensions.height10),
                              SmallText(text: 'Epitome of speed '),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconTextWidget(
                                      icon: Icons
                                          .airline_seat_recline_normal_rounded,
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
                    )
                  ],
                ),
              );
            }))
      ],
    );
  }

//  car slides
  Widget _buildCarItem(int position, ProductsModel item) {
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
          height: Dimensions.carView,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: position.isEven
                  ? const Color(0xFF16235A)
                  : const Color(0xFF16235A),
              image: DecorationImage(
                  image: NetworkImage(
                      "${APPCONSTANTS.baseUrl}${APPCONSTANTS.uploads}${item.img!}"),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.carViewText,
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                  const BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  const BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ]),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                  top: Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: item.name!),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.font15,
                                )),
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      SmallText(text: item.stars.toString()),
                      SizedBox(
                        width: Dimensions.height15,
                      ),
                      SmallText(text: '500 comments')
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height15,
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
