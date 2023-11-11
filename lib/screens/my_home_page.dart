import 'package:flutter/material.dart';
import 'package:payment_app_from_scratch/component/colors.dart';
import 'package:payment_app_from_scratch/controllers/data_controller.dart';
import 'package:payment_app_from_scratch/screens/payment_page.dart';
import 'package:payment_app_from_scratch/widgets/buttons.dart';
import 'package:payment_app_from_scratch/widgets/large_button.dart';
import 'package:payment_app_from_scratch/widgets/text_size.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                print('return CircularProgressIndicator');
                return Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                    width: 100,
                    height: 100,
                  ),
                );
              } else {
                //print('return listBills');
                return _listBills();
              }
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
      bottom: 20,
      child: AppLargeButton(
        text: 'Pay All Bills',
        textColor: Colors.white,
        onTap: () {
          Get.to(
            () => PaymentPage(),
          );
        },
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 320,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              height: 130,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 3, color: Colors.grey),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      _controller.list[index]['img']),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controller.list[index]['brand'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _controller.list[index]['paymentId'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedText(
                            text: _controller.list[index]['more'],
                            color: AppColor.green),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //print('tapped');
                                _controller.list[index]['status'] =
                                    !_controller.list[index]['status'];
                                _controller.list.refresh();
                                //print(_controller.list[index]['status']);
                                print(_controller.newList.length);
                              },
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: _controller.list[index]['status']
                                      ? AppColor.green
                                      : AppColor.selectBackground,
                                ),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: _controller.list[index]['status']
                                          ? Colors.white
                                          : AppColor.selectColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              '\$' + _controller.list[index]['due'],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.mainColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              'Due in 48 hours',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.idColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColor.halfOval,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _textContainer() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            'My Bills',
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Color(0xFF293952)),
          ),
        ),
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            'My Bills',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('images/background.png'),
          ),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('images/curve.png'),
          ),
        ),
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
      bottom: 15,
      right: 58,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.transparent,
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  height: MediaQuery.of(context).size.height - 240,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          color: Color(0xFFeef1f4).withOpacity(0.7),
                          width: MediaQuery.of(context).size.height,
                          height: MediaQuery.of(context).size.height - 300,
                        ),
                      ),
                      Positioned(
                        right: 58,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 25),
                          width: 60,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: AppColor.mainColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //todo stopped 2:06:14
                              AppButtons(
                                icon: Icons.cancel,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              AppButtons(
                                text: 'Add Bill',
                                icon: Icons.add,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              AppButtons(
                                text: 'History',
                                icon: Icons.history,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/lines.png'),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: Offset(0, 1),
                color: Color(0xFF11324d),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
