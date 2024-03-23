import 'package:app_present/page/homepage_login/login.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Application",
          style: TextStyle(
            fontSize: 18,
            // fontFamily:
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(50),
              width: 300,
              height: 250,
              child: Image.asset("images/ChatContract/Profile.jpg"),
            ),
          ),
          Container(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18),
                  )))
        ],
      ),
    );
  }
}
