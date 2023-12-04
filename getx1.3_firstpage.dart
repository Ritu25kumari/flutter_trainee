import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GetXFirstPage extends StatefulWidget {
  const GetXFirstPage({Key? key}) : super(key: key);
  @override
  State<GetXFirstPage> createState() => _GetXFirstPageState();
}
class _GetXFirstPageState extends State<GetXFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX First Page "),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.grey,
                      height: 200,
                      child:Center(child: Text('GetX StateManagement')),
                  ));
                },
                child: const Text('Show bottomsheet')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Get.defaultDialog(
                      title: 'GetX Alert',
                      middleText: 'Simple GetX alert',
                      textConfirm: 'Okay',
                      confirmTextColor: Colors.white,
                      textCancel: 'Cancel');
                },
                child: const Text('Show AlertDialog')),
          ],
        ),
      ),
    );
  }
}
