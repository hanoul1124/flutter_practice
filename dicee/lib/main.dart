import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: GetDicePage(),
      ),
    ),
  );
}

class Controller extends GetxController {
  RxInt leftDiceNum = 1.obs;
  RxInt rightDiceNum = 2.obs;

  void getRandomNum() {
    leftDiceNum.value = Random().nextInt(6) + 1;
    rightDiceNum.value = Random().nextInt(6) + 1;
  }
}

class GetDicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller diceController = Get.put(Controller());
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Obx(() {
                return Image.asset(
                    'images/dice${diceController.leftDiceNum}.png');
              }),
              onPressed: diceController.getRandomNum,
            ),
          ),
          Expanded(
            child: TextButton(
              child: Obx(() {
                return Image.asset(
                    'images/dice${diceController.rightDiceNum}.png');
              }),
              onPressed: diceController.getRandomNum,
            ),
          ),
        ],
      ),
    );
  }
}
