import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}


//Model class
class Album {
  final int? id;
  final String? title;
  const Album({this.id, this.title});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}



class RequestDelete extends StatefulWidget {
  const RequestDelete({super.key});
  @override
  State<RequestDelete> createState() {
    return _RequestDeleteState();
  }
}
class _RequestDeleteState extends State<RequestDelete> {
  late Future<Album> _futureAlbum;
  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete HTTP Request',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delete HTTP Request',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(child: Text('${snapshot.data?.id}')),
                      Text('${snapshot.data?.title}'),
                      ElevatedButton(child: const Text('Delete Data'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum = deleteAlbum(snapshot.data!.id.toString());
                          });
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              } return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class MyHomePage9 extends StatefulWidget {
//   @override
//   _MyHomePage9State createState() => _MyHomePage9State();
// }
//
// class _MyHomePage9State extends State<MyHomePage9> {
//   final String apiUrl = 'https://reqres.in/api/users/2';
//
//   Future<void> deleteData() async {
//     final response = await http.delete(
//       Uri.parse(apiUrl),
//       // headers: {
//       //
//       // },
//     );
//
//     if (response.statusCode == 204) {
//       print('DELETE request successful');
//     } else {
//       print('DELETE request failed with status: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HTTP DELETE Request Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             deleteData();
//           },
//           child: Text('Delete Data'),
//         ),
//       ),
//     );
//   }
// }
