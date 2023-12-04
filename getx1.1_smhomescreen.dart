import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx1.2_homepage.dart';
import 'getx1.3_firstpage.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text('GetX Statemanagement'),
          backgroundColor: Colors.blueGrey),
      body: GetBuilder<homeController>(
        init: homeController(),
        builder: (controller) => Center(
          child: Container(
            height: MediaQuery.of(context).size.height *0.2,
            width: MediaQuery.of(context).size.width *0.5,
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Counter is :  ${controller.counter}',style: TextStyle(fontSize: 18),),
                Text('name is :  ${controller.name}',style: TextStyle(fontSize: 18),),
                ElevatedButton(child: Icon(Icons.add),
                  onPressed: (){controller.increament();},),
                ElevatedButton(child: Text('first page'),
                  onPressed: (){
                    Get.to(()=> GetXFirstPage());
                  },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
