import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight_meeting_rooms/Components/buttons/button_roundedRectangle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:insight_meeting_rooms/Screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Uri myUri = Uri.parse("https://ssgmobile.github.io/api/room/rooms.json");
  var key, imgUrl, name, capacity;
  var numberOfRooms;
  List<dynamic> output;
  var response;

  Future<String> getData() async {
    response = await http.get(myUri);
    output = jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 175.0,
                  child: Image.asset('assets/house_logo.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                        color: Colors.grey[800],
                      ),
                      hintText: "Username",
                      fillColor: Color(0xffF1F4FB)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Password",
                      fillColor: Color(0xffF1F4FB)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.only(left: 75, right: 75),
            child: RoundedRectangle(
              textInButton: 'Log In',
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            rooms: output,
                          )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
