import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Your Dossier"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage("images/profile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ProfileInfoBox("Name", Icons.edit),
              SizedBox(height: 10), // Added space
              ProfileInfoBox("Email", Icons.edit),
              SizedBox(height: 10), // Added space
              ProfileInfoBox("College/University", Icons.edit),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ProfileInfoBox("Contact", Icons.edit),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ProfileInfoBox("Age", Icons.edit),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Your Interests",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10),
                  RoundedBox("#6F99A7", Icons.add, "", square: true),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: RoundedBox("#E6EDF0", Icons.edit, "Interest 1")),
                  SizedBox(width: 10),
                  Expanded(child: RoundedBox("#E6EDF0", Icons.edit, "Interest 2")),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: RoundedBox("#E6EDF0", Icons.edit, "Interest 3")),
                  SizedBox(width: 10),
                  Expanded(child: RoundedBox("#E6EDF0", Icons.edit, "Interest 4")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoBox extends StatelessWidget {
  final String text;
  final IconData icon;

  ProfileInfoBox(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE6EDF0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF6F99A7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}

class RoundedBox extends StatelessWidget {
  final String color;
  final IconData icon;
  final String text;
  final bool square;

  RoundedBox(this.color, this.icon, this.text, {this.square = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          if (square) SizedBox(width: 30),
          Text(text),
          if (!square) SizedBox(width: 30),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF6F99A7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
