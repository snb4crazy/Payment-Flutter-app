import 'package:flutter/material.dart';
import 'package:payment_app_from_scratch/component/colors.dart';

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
          ],
        ),
      ),
    );
  }

  //22:30 finished
  _listBills() {
    return Positioned(
      top: 320,
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            color: Colors.red,
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
    );
  }
}
