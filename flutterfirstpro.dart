import 'package:flutter/material.dart';
import 'package:ritu_trainee/dummyapi.dart';
import 'package:ritu_trainee/series1_ImagePicker.dart';
import 'package:ritu_trainee/series2_DateTimePicker.dart';
import 'package:ritu_trainee/series3_bmicalculator.dart';
import 'package:ritu_trainee/series4_imageGridview.dart';
import 'package:ritu_trainee/series4_imagegrid.dart';
import 'package:ritu_trainee/series4_like_imagepostmodel.dart';
import 'package:ritu_trainee/series5_editImage.dart';
import 'package:ritu_trainee/series6_updateImage.dart';
import 'package:ritu_trainee/series7.1_drawerconcept.dart';
import 'package:ritu_trainee/series8_navigationbar.dart';
import 'package:ritu_trainee/series9.1_navigationdesign.dart';

import 'like_button.dart';
class FirstProject extends StatefulWidget {
  @override
  State<FirstProject> createState() => _FirstProjectState();
}
class _FirstProjectState extends State<FirstProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Page',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal[900],
        ),

        body:
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/16108218/pexels-photo-16108218/free-photo-of-a-dandelion-in-the-grass-with-a-tree-in-the-background.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    fit: BoxFit.cover
                ),

              ),
              child: Center(
                  child: Container(
                    width: 250,
                    height: 500,
                    color: Colors.teal[800],
                    child: Column(
                      children: [
                        ElevatedButton(child: const Text('ImagePicker',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> ImagePickerApp())),),
                        ElevatedButton(child: const Text('Date&Time Picker',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const TimeDatePicker())),),
                        ElevatedButton(child: const Text('BMI Calculator',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BmiCalculator())),),
                        // ElevatedButton(child: const Text('Image Grid View',style: TextStyle(color: Colors.black),),
                        // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>GridExample())),),
                        // ElevatedButton(child: const Text('PostModel',style: TextStyle(color: Colors.black),),
                        // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostImage())),),
                        // ElevatedButton( child: Text('new post model'),
                        // onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>GridImage())),),
                        // ElevatedButton(child: Text('VibeTalk'),
                        // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSelectionScreen())),),
                        // ElevatedButton(child: Text('Edit Images'),
                        // onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>EditImage())),),
                        ElevatedButton(child: const Text('Update Image',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateImage())),),
                        ElevatedButton(child: const Text('Drawer Concept',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>DrawerConcept())),),
                        ElevatedButton( child: const Text('Navigation Bar Concept',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>NavigationBarConcept())),),
                        ElevatedButton( child: const Text('Bottom Navigation Design ',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Grocerystore())),),
                        ElevatedButton( child: Text('Dummy API',style: TextStyle(color: Colors.black),),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Dummy())),)
                      ],
                    ),
                  ),
                ),
            ),
        );

  }
}
