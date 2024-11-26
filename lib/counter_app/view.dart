import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/counter_app/controller.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CountCtroller countCtroller = Get.put(CountCtroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() => Text(countCtroller.count.toString())),
          const Text('Times Pressed.'),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: countCtroller.increment),
    );
  }
}
