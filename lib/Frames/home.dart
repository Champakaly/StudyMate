import 'package:flutter/material.dart';
import 'Profile.dart';
import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage("url_to_profile_image"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "User Name",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {
                      // Handle home tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout"),
                    onTap: () {
                      // Handle logout tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Groups",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            buildGroupsGrid(context),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.group),
                SizedBox(width: 10),
                Text(
                  "Join Other Communities",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildPlusRectangle(),
                buildPlusRectangle(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildPlusRectangle(),
                buildPlusRectangle(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGroupsGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGroupRectangle("Create Group"),
            buildGroupRectangle("IOT", ["CHAT", "ZOOM"], context),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGroupRectangle("CD", ["CHAT", "ZOOM"]),
            buildGroupRectangle("AI", ["CHAT", "ZOOM"]),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildGroupRectangle("CRP", ["CHAT", "ZOOM"]),
            buildGroupRectangle("BCS", ["CHAT", "ZOOM"]),
          ],
        ),
      ],
    );
  }

  Widget buildGroupRectangle(String title, [List<String>? subTitles, BuildContext? context]) {
    return GestureDetector(
      onTap: () {
        if (context != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupChatPage()),
          );
        }
      },
      child: Container(
        width: 180,
        height: 120,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF3F788B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(height: 50),
            if (subTitles != null && subTitles.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (String subtitle in subTitles)
                    Container(
                      width: 70,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color(0xFFD1E9F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          subtitle,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget buildPlusRectangle() {
    return Container(
      width: 180,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF3F788B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
