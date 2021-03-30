import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:insight_meeting_rooms/Components/detailsColumns.dart';
import 'package:insight_meeting_rooms/Components/buttons/button_roundedRectangle.dart';


class RoomDetailsScreen extends StatefulWidget {
  final String key1;
  RoomDetailsScreen({this.key1});

  @override
  _RoomDetailsScreenState createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  Map<String, dynamic> myMap;

  var response;

  Uri myUri;


  Future<String> getData() async {
    myUri = Uri.parse(
        "https://ssgmobile.github.io/api/room/detail/${widget.key1}.json");
    response = await http.get(myUri);
    myMap = new Map<String, dynamic>.from(jsonDecode(response.body));

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
      body: FutureBuilder<String>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
                child: ListView(
              children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(height: 275,),
                        Container(child: Image.network(myMap['heroImageUrl'])),
                        Positioned(left: -10,
                            // ignore: deprecated_member_use
                            child: FlatButton(onPressed:(){ Navigator.pop(context);},padding: EdgeInsets.all(0) ,child: Icon(Icons.keyboard_backspace_rounded, color: Colors.black, size: 40,))),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myMap['name'],
                              style: TextStyle(fontSize: 32),
                            ),
                            Row(
                              children: [
                                Icon(Icons.people, size: 20, color: Colors.black,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  myMap['capacity'].toString(),
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star_border, size: 20, color: Colors.black,),
                                SizedBox(
                                  width: 10,
                                ),

                                for (int i=0; i<myMap['features'].length; i++) Text(
                                  '${myMap['features'][i]['name']} | ',
                                  style: TextStyle(fontSize: 11),
                                ),


                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  const Divider(
                                    height: 20,
                                    thickness: 2,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.location_on_rounded, color: Colors.black, size: 40,),

                                      Text(
                                        '${myMap['location']['floor']['name']}\n${myMap['location']['building']['name']}\n${myMap['location']['site']['name']}\n${myMap['location']['region']['name']}',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Facilities', style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold, color: Color(0xffADB8CB)),),
                                            for (int i=0; i<myMap['facilities'].length; i++) DetailsColumns(myMap: myMap, index: i, heading: 'facilities',),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Text('Services', style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold, color: Color(0xffADB8CB))),
                                          for (int i=0; i<myMap['services'].length; i++) DetailsColumns(myMap: myMap, index: i, heading: 'services',),

                                        ],
                                      ),


                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Equipment', style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold, color: Color(0xffADB8CB)),),
                                      for (int i=0; i<myMap['equipment'].length; i++) DetailsColumns(myMap: myMap, index: i, heading: 'equipment',),

                                      SizedBox(height: 30,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Center(child: RoundedRectangle(textInButton: 'Book Now', color: Colors.black, onPressed: (){
                              //Add Book functionality
                            },))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
