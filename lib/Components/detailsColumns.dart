import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsColumns extends StatelessWidget {

  final Map<String, dynamic> myMap;
  final int index;
  final String heading;
  DetailsColumns({this.myMap, this.index, this.heading});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Container(height: 20, width: 20,child: Image.network('${myMap[heading][index]['iconUrl']}')),
            SizedBox(width: 20,),
            Text('${myMap[heading][index]['name']}',),
          ],
        ),
      ],
    );
  }
}
