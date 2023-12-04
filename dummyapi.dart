import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritu_trainee/Bindings/bindings_mainpage.dart';
import 'package:ritu_trainee/api10_delete_request.dart';
import 'package:ritu_trainee/api2.1_product_responces.dart';
import 'package:ritu_trainee/api3.1_cart_list.dart';
import 'package:ritu_trainee/api4.1_usersdetail.dart';
import 'package:ritu_trainee/api5.1_postsdetail.dart';
import 'package:ritu_trainee/api6.1_comments.dart';
import 'package:ritu_trainee/api8.1_postreq.dart';
import 'package:ritu_trainee/api8.2_login_signup.dart';
import 'package:ritu_trainee/api9.1_swagger_user.dart';
import 'package:ritu_trainee/dummy_statemanagement/mainpage.dart';
import 'package:ritu_trainee/getx1.1_smhomescreen.dart';
import 'package:ritu_trainee/product_discription/mainpage.dart';
import 'package:ritu_trainee/state_management/getx2.2_homescreen.dart';
class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.deepPurple ,
        title: Text('API Projests',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Container(width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/614117/pexels-photo-614117.jpeg?auto=compress&cs=tinysrgb&w=600'),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              // ElevatedButton( child: Text('product'),
              // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductResponse())),),
              // ElevatedButton(child: Text('cart'),
              //   onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartList())),),
              // ElevatedButton(child: Text('user'),
              //   onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersDetail()))),
              // ElevatedButton(child: Text('Posts'),
              //   onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostsDetail()))),
              // ElevatedButton(child: Text('Comments'),
              //   onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentsDetails()))),
              // ElevatedButton(child: Text('post request'),
              //   onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductResponse1())),),
              ElevatedButton(child: Text('Sign up Post request'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPost()))),
              ElevatedButton(child: Text('Swagger User'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AppUsers())),),
              ElevatedButton(child: Text('Delete Requet'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestDelete())),),
              ElevatedButton(child: Text('Getx Statemanagement'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())),),
              // ElevatedButton(child: Text('cart Getx'),
              // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartListView())),)
              ElevatedButton(child: Text('GetX user'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage())),),
              ElevatedButton(child: Text('Bindings'),
              onPressed: (){Get.to(()=>MainOfBinding());
              },),
              ElevatedButton(child: Text('Product dis'),
              onPressed: (){Get.to(()=>ProductDiscription());
                },)
            ],
          ),
        ),
      ),
    );
  }
}
