import 'package:dioreq/common/helper/navigator/app_navigator.dart';
import 'package:dioreq/presentation/todo/page/todo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    AppNavigator.push(context, const TodoPage());
                  },
                  child: const Text("Get Todo's")),
            ],
          ),
        ),
      ),
    );
  }
}
