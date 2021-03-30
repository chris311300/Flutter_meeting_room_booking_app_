import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/start_screen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/homeScreen.dart';
import 'package:insight_meeting_rooms/Screens/roomDetailsScreen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitUp],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.white,
        fontFamily: 'Robot',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.black,
      ),
      initialRoute: 'startScreen',
      routes: {
        'startScreen': (context) => StartScreen(),
        'loginScreen': (context) => LoginScreen(),
        'homeScreen': (context) => HomeScreen(),
        'roomDetailScreen': (context) => RoomDetailsScreen(),
      },
    );
  }
}

