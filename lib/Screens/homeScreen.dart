import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight_meeting_rooms/Components/roomSnapshotCard.dart';

class HomeScreen extends StatefulWidget {
  final List<dynamic> rooms;
  HomeScreen({this.rooms});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

GlobalKey _bottomNavigationKey = GlobalKey();

class _HomeScreenState extends State<HomeScreen> {
  int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (_page == 1) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "Insight".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          height: 50,
          backgroundColor: Colors.black,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.person, size: 30),
            Icon(Icons.home, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.grey.shade100,
              height: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Book a meeting room.",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 50,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: DataSearch(roomData: widget.rooms));
                        },
                        child: Container(
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.search),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Meeting Rooms",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.rooms.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RoomSnapshotCard(
                        key1: widget.rooms[index]['key'],
                        imgUrl1: widget.rooms[index]['thumbnailUrl'],
                        capacity1: widget.rooms[index]['capacity'],
                        name1: widget.rooms[index]['name'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (_page == 0) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "Insight".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              width: double.infinity,
              height: 20,
            ),
            CircleAvatar(
              radius: 80,
              child: ClipOval(child: Image.asset('assets/cat_avatar.jpg')),
              backgroundColor: Colors.black,
            ),
            SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Text(
              "John Doe",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "London, England",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          height: 50,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.person, size: 30),
            Icon(Icons.home, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      );
    }
  }
}

class DataSearch extends SearchDelegate<String> {
  List roomData;

  DataSearch({this.roomData});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List name = [];
    List capacity = [];
    List key = [];
    List thumbnailUrl = [];
    List emptyList = [];

    for (int i = 0; i < roomData.length; i++) {
      name.add(roomData[i]['name']);
      capacity.add(roomData[i]['capacity']);
      key.add(roomData[i]['key']);
      thumbnailUrl.add(roomData[i]['thumbnailUrl']);
    }

    final suggestionList = query.isEmpty
        ? emptyList
        : name
            .where((i) => i.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => RoomSnapshotCard(
        key1: key[index],
        imgUrl1: thumbnailUrl[index],
        capacity1: capacity[index],
        name1: suggestionList[index],
      ),
    );
  }
}
