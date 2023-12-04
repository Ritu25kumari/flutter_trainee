import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ritu_trainee/api6_comments_model.dart';
class CommentsDetails extends StatefulWidget {
  const CommentsDetails({super.key});
  @override
  State<CommentsDetails> createState() => _CommentsDetailsState();
}
class _CommentsDetailsState extends State<CommentsDetails> {
  CommentsDummyModel? postcomments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Comments Detail',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          if(postcomments?.comments!=null)
            Expanded(child: ListView.builder(
                itemCount: postcomments!.comments!.length,
                itemBuilder: (context, index){
                  final commentsinfo = postcomments!.comments![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${commentsinfo.id}'),
                          Text(commentsinfo.body??'body'),
                          Text('${commentsinfo.postId}'),
                          Text('${commentsinfo.user?.id}'),
                          Text(commentsinfo.user?.username??'username')
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
    loadcomment();
  }
  void loadcomment() async{
    final commentdio = Dio();
    final commentsinfo = await commentdio.get('https://dummyjson.com/comments');
    postcomments = CommentsDummyModel.fromJson(commentsinfo.data);
    setState(() {
    });

  }
}
