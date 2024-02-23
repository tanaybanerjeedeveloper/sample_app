import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:net_app/providers/home_screen_provider.dart';
import 'package:net_app/widgets/common_button.dart';
import 'package:net_app/widgets/todo_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePvd = ref.watch(homeProvider);
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
                  color:
                      (homePvd.isLoading) ? Colors.grey.shade400 : Colors.blue,
                  onPressed:
                      (homePvd.isLoading) ? null : () => homePvd.getData(),
                  widget: (homePvd.isLoading)
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
                (homePvd.data.isEmpty && homePvd.isLoading == false)
                    ? SizedBox()
                    : (homePvd.isLoading)
                        ? Column(
                            children: [
                              SizedBox(),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: homePvd.data.length,
                            itemBuilder: (context, index) => TodoWidget(
                                isCompleted: homePvd.data[index]['completed'],
                                title: homePvd.data[index]['title']))
                // (homePvd.data != null && homePvd.data.isNotEmpty)
                //     ? ListView.builder(
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         itemCount: homePvd.data.length,
                //         itemBuilder: (context, index) => TodoWidget(
                //             isCompleted: homePvd.data[index]['completed'],
                //             title: homePvd.data[index]['title']))
                //     : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
