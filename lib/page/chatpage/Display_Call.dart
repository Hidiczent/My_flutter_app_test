// import 'package:app_present/page/Shoppage/Hompage.dart';
import 'package:app_present/page/chatpage/Display_message.dart';
import 'package:app_present/page/chatpage/Showchat.dart';
import 'package:app_present/src/UserContract.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisplayCall extends StatefulWidget {
  const DisplayCall({super.key});

  @override
  State<DisplayCall> createState() => _DisplayCallState();
}

class _DisplayCallState extends State<DisplayCall> {
  int _index = 0;
  List<Contract> messages = [
    Contract(
        name: "Somsanit",
        time: DateTime.now(),
        photo: "images/ChatContract/Nit.jpg"),
    Contract(
        name: "Big",
        time: DateTime.now(),
        photo: "images/ChatContract/Big.jpg"),
    Contract(
        name: "Palame",
        time: DateTime.now(),
        photo: "images/ChatContract/Palame.jpg"),
    Contract(
        name: "Souk",
        time: DateTime.now(),
        photo: "images/ChatContract/Souk.jpg"),
    Contract(
        name: "Som",
        time: DateTime.now(),
        photo: "images/ChatContract/Som.jpg"),
    Contract(
        name: "Noy",
        time: DateTime.now(),
        photo: "images/ChatContract/Noy.jpg"),
    Contract(
        name: "Tadam",
        time: DateTime.now(),
        photo: "images/ChatContract/tadam.jpg"),
    Contract(
        name: "Pe", time: DateTime.now(), photo: "images/ChatContract/Pe.jpg"),
  ];
  int? hoveredCardIndex;
  double opacityValue = 0.2; // Initial opacity value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Remove the unnecessary MaterialPageRoute
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(
              Icons.video_call,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Text("Message"),
      ),
      // drawer: Drawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final chat = messages[index];
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                hoveredCardIndex = index;
                opacityValue = 0.1;
              });
            },
            onExit: (_) {
              setState(() {
                hoveredCardIndex = null;
                opacityValue = 0.1;
              });
            },
            child: Card(
              margin: EdgeInsets.all(0),
              color: hoveredCardIndex == index
                  ? Colors.grey.withOpacity(opacityValue) // Color when hovered
                  : const Color.fromARGB(255, 0, 0, 0),
              child: ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chat.photo),
                  radius: 30,
                ),
                title: Text(
                  chat.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.phone_callback_rounded,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: 5), // Adjust the width as needed
                      ),
                      TextSpan(
                        text: DateFormat.Hm().format(chat.time),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                trailing: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                onTap: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => ShowChat());
                  Navigator.of(context).push(route);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(
                "12",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.chat_bubble,
              ),
            ),
            label: "Messages",
            backgroundColor: _index == 0 ? Colors.blue : Colors.black, // ตรงนี้
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(
                "9",
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.call,
              ),
            ),
            label: "Call Log",
            backgroundColor:
                _index == 1 ? Colors.blue : Colors.black, // และตรงนี้
          ),
        ],
        selectedFontSize: 16,
        selectedItemColor: Colors.blue, // ไม่ต้องใส่ที่นี่
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Displaymenu()));
              print("Messages");
            } else if (index == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DisplayCall()));
              print("Call Log");
            }
          });
        },
      ),
    );
  }
}
