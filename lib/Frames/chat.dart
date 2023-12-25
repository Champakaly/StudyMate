import 'package:flutter/material.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupChatPage(),
    );
  }
}

class GroupChatPage extends StatefulWidget {
  @override
  _GroupChatPageState createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  List<ChatMessage> messages = [];

  void _handleSend(String messageText) {
    setState(() {
      messages.add(
        ChatMessage(
          senderName: "You",
          message: messageText,
          time: "Now",
          isCurrentUser: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("IOT"),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // Handle video call button press
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Exit Group"),
                  onTap: () {
                    // Handle exit group option
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages and date
          Expanded(
            child: ListView(
              children: messages,
            ),
          ),
          // Text input box
          ChatInputBox(onSend: _handleSend),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String senderName;
  final String message;
  final String time;
  final bool isCurrentUser;

  ChatMessage({
    required this.senderName,
    required this.message,
    required this.time,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!isCurrentUser)
            Row(
              children: [
                CircleAvatar(
                  // Add sender's profile image
                  radius: 20.0,
                ),
                SizedBox(width: 8.0),
                Text(senderName),
              ],
            ),
          Container(
            margin: EdgeInsets.only(top: 4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.grey : Color(0xFF6F99A7),
              borderRadius: isCurrentUser
                  ? BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(0.0),
              )
                  : BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isCurrentUser ? Colors.black : Colors.white,
              ),
            ),
          ),
          Align(
            alignment: isCurrentUser
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInputBox extends StatefulWidget {
  final Function(String) onSend;

  ChatInputBox({required this.onSend});

  @override
  _ChatInputBoxState createState() => _ChatInputBoxState();
}

class _ChatInputBoxState extends State<ChatInputBox> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String messageText = _textEditingController.text;
              if (messageText.isNotEmpty) {
                widget.onSend(messageText);
                _textEditingController.clear();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
