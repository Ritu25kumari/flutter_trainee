// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'api2_product_response_model.dart';
// Future<ProductResponceModel> createProductResponceModel(String title) async {
//   final response = await http.post(
//     Uri.parse('https://dummyjson.com/products'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );//   if (response.statusCode == 201) {
//     return ProductResponceModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to create album.');
//   }
// }
//
// class Album {
//   final int id;
//   final String title;
//
//   const Album({required this.id, required this.title});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
// class PostRequest extends StatefulWidget {
//   const PostRequest({super.key});
//
//   @override
//   State<PostRequest> createState() {
//     return _PostRequestState();
//   }
// }
//
// class _PostRequestState extends State<PostRequest> {
//   final TextEditingController _controller = TextEditingController();
//   Future<ProductResponceModel>? _futureAlbum;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Data Example',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create Data Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8),
//           child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
//         ),
//       ),
//     );
//   }
//
//   Column buildColumn() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextField(
//           controller: _controller,
//           decoration: const InputDecoration(hintText: 'Enter Title'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _futureProductResponceModel = createProductResponceModel(_controller.text);
//             });
//           },
//           child: const Text('Create Data'),
//         ),
//       ],
//     );
//   }
//   FutureBuilder<ProductResponceModel> buildFutureBuilder() {
//     return FutureBuilder<ProductResponceModel>(
//       future: _futureProductResponceModel,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Text(snapshot.data!.title);
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }
