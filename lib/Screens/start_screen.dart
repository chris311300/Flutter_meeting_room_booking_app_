import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight_meeting_rooms/Components/buttons/button_roundedRectangle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: animation.value,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 200, left: 30, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textBaseline: TextBaseline.ideographic,
              children: [
                Container(
                  child: Image.asset('assets/house_logo.png'),
                  height: 80,
                ),
                SizedBox(
                  width:0,
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 225.0,
                          child: TextLiquidFill(
                            text: 'INSIGHT',
                            waveColor: Colors.black,
                            boxBackgroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 55.0,
                              fontWeight: FontWeight.bold,
                            ),
                            boxHeight: 80.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meeting Rooms'.toUpperCase(),
                style: TextStyle(fontSize: 17, color: Color(0xffADB8CB)),
              )
            ],
          ),
          SizedBox(
            height: 200,
          ),
          RoundedRectangle(
            textInButton: 'Log In',
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, 'loginScreen');
            },
          ),
          SizedBox(
            height: 20,
          ),
          RoundedRectangle(
            textInButton: 'Register',
            color: Colors.black,
            onPressed: () {
              // ignore: deprecated_member_use
              _scaffoldKey.currentState.showSnackBar(new SnackBar(
                  content: new Text('Registration Button Clicked')));
            },
          ),
        ],
      ),
    );
  }
}
