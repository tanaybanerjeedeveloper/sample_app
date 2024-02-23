import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({super.key, required this.isCompleted, required this.title});
  final String title;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        trailing: (isCompleted) ? Text('Done') : Text('Not Done'),
      ),
    );
  }
}
