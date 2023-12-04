import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ritu_trainee/api5_postsdetail_model.dart';
class PostsDetail extends StatefulWidget {
  const PostsDetail({super.key});

  @override
  State<PostsDetail> createState() => _PostsDetailState();
}
class _PostsDetailState extends State<PostsDetail> {
 PostsDetailModel? detailofpost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Posts Details',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          if(detailofpost?.posts!=null)
            Expanded(child: ListView.builder(
                itemCount: detailofpost!.posts!.length,
                itemBuilder: (context, index){
                  final user = detailofpost!.posts![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Row(
                                  children: [
                                    Text('${user.id}\.\ ',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(user.title??'title',style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold),),
                                  ],
                                ),

                                Text(user.body??'body'),
                                Text('${user.userId}'),
                                Text('${user.tags}'),
                                Text('${user.reactions}')
                          ],
                        ),
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
    loadPosts();
  }
  void loadPosts() async{
    final postdio = Dio();
    final postsinfo = await postdio.get('https://dummyjson.com/posts');
    detailofpost = PostsDetailModel.fromJson(postsinfo.data);
    setState(() {
    });

  }
}
