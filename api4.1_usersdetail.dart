import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ritu_trainee/api4_userdetail_model.dart';
class UsersDetail extends StatefulWidget {
  const UsersDetail({super.key});

  @override
  State<UsersDetail> createState() => _UsersDetailState();
}

class _UsersDetailState extends State<UsersDetail> {
  UserDetailModel? userdetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users Detail',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: [
          if(userdetail?.users!=null)
            Expanded(child: ListView.builder(
                itemCount: userdetail!.users!.length,
                itemBuilder: (context, index){
                  final user = userdetail!.users![index];
                  return Card(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.indigo,)),
                    child: Container(
                      child: Row(
                        children: [
                          Image.network(user.image??'image',height: 200,width: 200,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${user.id}'),
                                Text(user.firstName??'first name'),
                                Text(user.lastName??'last name'),
                                Text(user.maidenName??'maidenName'),
                                Text('${user.age}'),
                                Text(user.gender??'gender'),
                                Text(user.email??'email'),
                                Text(user.phone??'phone'),
                                Text(user.username??'username'),
                                Text(user.password??'password'),
                                Text(user.birthDate??'birthdate'),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
            }))
        ],
      ),
    );
  }
  void initState(){
    super.initState();
    loadUser();
  }
  void loadUser() async{
    final userdio = Dio();
    final userresponse = await userdio.get('https://dummyjson.com/users');
    userdetail = UserDetailModel.fromJson(userresponse.data);
    setState(() {

    });

  }
}
