import 'package:flutter/material.dart';

class ReadableScreen extends StatelessWidget {
  const ReadableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(child: ListTile());
        },
      ),
    );
  }
}
