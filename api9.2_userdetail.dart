import 'package:flutter/material.dart';
import 'api9_swagger_user_model.dart';
class UserDetailsPage extends StatelessWidget {
  final Data userData;
  UserDetailsPage({required this.userData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text('User full Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            height: 400,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.network(userData.avatar??'avatar',fit:BoxFit.cover ,),
                ),
                SizedBox(height: 10,),
                Text('ID: ${userData.id}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('Name: ${userData.firstName} ${userData.lastName}',style: TextStyle(fontSize: 20),),
                Text('Email: ${userData.email}',style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

