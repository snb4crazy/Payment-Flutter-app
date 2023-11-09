import 'package:flutter/material.dart';
import 'package:payment_app_from_scratch/component/colors.dart';
import 'package:payment_app_from_scratch/widgets/large_button.dart';
import 'package:payment_app_from_scratch/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
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
        ));
  }

  //22:30 finished
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
          itemCount: 4,
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
                                  image: AssetImage('images/brand1.png'),
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
                                  'Text ticket #1',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'ID or HASH for ticket #1',
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
                            text: 'Autopay on DD:MM:YYY',
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
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColor.selectBackground,
                              ),
                              child: Center(
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.selectColor),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              '\$12345.00',
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
        ],
      ),
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
              backgroundColor: Colors.grey.withOpacity(0.5),
              barrierColor: Colors.transparent,
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  height: MediaQuery.of(context).size.height - 240,
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
