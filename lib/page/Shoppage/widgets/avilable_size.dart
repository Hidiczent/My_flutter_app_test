import 'package:flutter/material.dart';

class Available extends StatefulWidget {
  final String size;
  const Available({Key? key, required this.size}) : super(key: key);

  @override
  State<Available> createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  bool isSlected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSlected = !isSlected;
          ;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSlected ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.red),
        ),
        child: Text(
          "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
