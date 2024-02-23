import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:net_app/widgets/common_button.dart';
import 'package:net_app/widgets/todo_widget.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  bool _isLoading = false;
  List _data = [];

  getData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      _data = json.decode(response.body);
      print('response: $_data');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Something went wrong, please try again later'),
      ));
      print('error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                CommonButton(
                  color: (_isLoading) ? Colors.grey.shade400 : Colors.blue,
                  onPressed: (_isLoading) ? null : () => getData(),
                  widget: (_isLoading)
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Press Here',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                (_data.isEmpty && _isLoading == false)
                    ? SizedBox()
                    : (_isLoading)
                        ? Column(
                            children: [
                              SizedBox(),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _data.length,
                            itemBuilder: (context, index) => TodoWidget(
                                isCompleted: _data[index]['completed'],
                                title: _data[index]['title']))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
