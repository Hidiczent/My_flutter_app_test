

import 'package:app_present/page/homepage_login/Homepage.dart';
import 'package:flutter/material.dart';

// import 'package:home_work/homelogin.dart';


class UserRole extends StatefulWidget {
  final String email;
  final String username;
  final String password;

  const UserRole({
    Key? key,
    required this.email,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<UserRole> createState() => _UserRoleState();
}

class _UserRoleState extends State<UserRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to world"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Email: ${widget.email}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Username: ${widget.username}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Password: ${widget.password}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.home),
          label: Text("ກັບສູ່ໜ້າຫຼັກ"),
        )
      ],
    );
  }
}
