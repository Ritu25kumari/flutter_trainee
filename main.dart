import 'package:flutter/material.dart';
import 'package:ritu_trainee/Bindings/bindings.dart';
import 'package:ritu_trainee/Bindings/page1_controller.dart';
import 'package:ritu_trainee/Bindings/page1_view.dart';
import 'package:ritu_trainee/Bindings/page1binding.dart';
import 'package:ritu_trainee/Bindings/page2_controller.dart';
import 'package:ritu_trainee/flutterfirstpro.dart';
import 'package:get/get.dart';
import 'Bindings/page2_view.dart';
import 'Bindings/page2binding.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      getPages: [
        GetPage(name: '/page1', page: ()=>Page1View(),
            //binding: Page1Binding()
             binding: BindingsBuilder((){
               Get.lazyPut<Page1Controller>(() =>Page1Controller());
             })
        ),

        GetPage(name: '/page2', page: ()=>Page2View(),
            //binding: Page2Binding()
          binding: BindingsBuilder((){
            Get.lazyPut<Page2Controller>(() => Page2Controller());
          })
        ),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage1(),
    );
  }
}
class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}
class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Center(child: Text('Flutter Project',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: ElevatedButton(child: const Text('First Project'),
        onPressed: (){
          Get.to(()=>FirstProject());}
          //onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstProject())),
        )
      ),
    );
  }
}
