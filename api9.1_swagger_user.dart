import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ritu_trainee/api9.2_userdetail.dart';
import 'dart:convert';
import 'api9_swagger_user_model.dart';
// Future<SwaggerUserModel> fetchGetUserModel() async {
//   final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
//
//   if (response.statusCode == 200) {
//     return SwaggerUserModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
// class SwagerUser extends StatefulWidget {
//   const SwagerUser({Key? key}) : super(key: key);
//   @override
//   State<SwagerUser> createState() => _SwagerUserState();
// }
// class _SwagerUserState extends State<SwagerUser> {
//   late Future<SwaggerUserModel> futureGetUserModel;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     futureGetUserModel = fetchGetUserModel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fetch Data Example'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: FutureBuilder<SwaggerUserModel>(
//           future: futureGetUserModel,
//           builder: (BuildContext context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             }
//             else if (snapshot.hasData) {
//               final userModel = snapshot.data!;
//               return ListView(
//                 children: [
//                   ListTile(
//                     title: Text('Page: ${userModel.page}'),
//                   ),
//                   ListTile(
//                     title: Text('PerPage: ${userModel.perPage}'),
//                   ),
//                   ListTile(
//                     title: Text('Total: ${userModel.total}'),
//                   ),
//                   ListTile(
//                     title: Text('Total Pages: ${userModel.totalPages}'),
//                   ),
//                   if (userModel.data != null)...userModel.data!.map((userData) {
//                       return ListTile(
//                         title: Text('${userData.firstName} ${userData.lastName}'),
//                         subtitle: Text('${userData.email}'),
//                         trailing: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent,),
//                                   child: Text('ID: ${userData.id}',style: TextStyle(color: Colors.black),),
//                                   onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SwagerUserDetail())),),
//                         leading: Image.network(userData.avatar??'avatar'),
//                       );
//                     }).toList(),
//                 ],
//               );
//             } else {
//               return Text('No data available');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
Future<SwaggerUserModel> fetchGetUserModel(int page) async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
  if (response.statusCode == 200) {
    return SwaggerUserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
class AppUsers extends StatefulWidget {
  const AppUsers({Key? key}) : super(key: key);
  @override
  State<AppUsers> createState() => _AppUsersState();
}
class _AppUsersState extends State<AppUsers> {
  late ScrollController _scrollController;
  List<Data> users = [];
  int currentPage = 1;
  int totalPages = 6;
  _AppUsersState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _loadData();
  }
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }
  Future<void> _loadData() async {
    try {
      if (currentPage <= totalPages) {
        final userModel = await fetchGetUserModel(currentPage);
        if (userModel.data != null) {
          setState(() {
            users.addAll(userModel.data!);
            currentPage++;
            totalPages = userModel.totalPages!;
          });
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagination Example',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: users.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < users.length) {
            final userData = users[index];
            return Container(
              color: Colors.cyan[300],
              child: Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Container(
                    height: 80,
                    child: Row(
                      children: [
                        Text('${userData.id}.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        Spacer(),
                        ElevatedButton(
                          child:Text('ID: ${userData.id}', style: TextStyle(fontSize: 15)),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailsPage(userData: userData)))
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            if (currentPage <= totalPages) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SizedBox();
            }
          }
        },
      ),
    );
  }
}




