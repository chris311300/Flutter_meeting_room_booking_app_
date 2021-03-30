import 'package:flutter/material.dart';
import 'package:insight_meeting_rooms/Screens/roomDetailsScreen.dart';



class RoomSnapshotCard extends StatefulWidget {
  final String key1, imgUrl1, name1;
  final int capacity1;
  RoomSnapshotCard({this.capacity1, this.name1, this.key1, this.imgUrl1});

  @override
  _RoomSnapshotCardState createState() => _RoomSnapshotCardState();
}

class _RoomSnapshotCardState extends State<RoomSnapshotCard> {





  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        // ignore: deprecated_member_use
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoomDetailsScreen(key1: widget.key1,)),
            );
          },
          child: Card(
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(widget.imgUrl1.toString())),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.transparent,
                  ),
                ),

                SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name1.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 23),
                    ),
                    Row(
                      children: [
                        Icon(Icons.people),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.capacity1.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
