
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignUpPost extends StatefulWidget {
  const SignUpPost({super.key});

  @override
  State<SignUpPost> createState() => _SignUpPostState();
}

class _SignUpPostState extends State<SignUpPost> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email,password) async{
    try{
      var response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {
            'email':email,
            'password':password,
          }
      );
      if(response.statusCode==200){
        print('account created sucessfully');
        print(response.body);
      }
      else{
        print('failed');
      }
    }
        catch(e){
      print(e.toString());
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up with post'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText:'email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password'
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordController.text.toString());
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('signup')),
              ),
            )
            // GestureDetector(
            //   child: ElevatedButton(child: Text('sign-up'),
            //   onPressed: (){
            //     login(emailController.text.toString(),passwordController.text.toString());
            //   },),
            // )

          ],
        ),
      ),
    );
  }
}
