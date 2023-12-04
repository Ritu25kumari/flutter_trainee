import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class PostModel{
  final String imageUrl;
  final String title;
  final String description;
  bool isLiked;
  PostModel(this.imageUrl,this.title,this.description,this.isLiked);
}
class GridImage extends StatefulWidget {
  @override
  GridImageState createState() => GridImageState();
}

class GridImageState extends State<GridImage> {
  void _showImagePicker(BuildContext context){
    TextEditingController _titleController = TextEditingController();
    TextEditingController _deccriptionController = TextEditingController();
    File? selectedImage;
Future _getImageCamera() async {
  final picker = ImagePicker();
  final pickedfile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedfile != null) {
      setState(() {
        selectedImage = File(pickedfile!.path);
      });
    }
  }
Future _getImageGallery() async {
  final pickedfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (posts != null) {
    setState(() {
      selectedImage = File(pickedfile!.path);
    });
  }
}
  String tempTitle = '';
  String tempDescription = '';
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if(selectedImage != null)
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(selectedImage!),
                            fit: BoxFit.cover,
                          )
                      ),
                    )
                  else
                    ElevatedButton(onPressed: () {
                       _getImageGallery();
                       _getImageCamera();
                      },
                        child: Text('Select Image')),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (value){
                      tempTitle  = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Title',
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (value){
                      tempDescription = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter description'
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    if(selectedImage !=null &&
                    tempTitle.isNotEmpty &&
                    tempDescription.isNotEmpty){
                     _addPost(selectedImage!.path,tempTitle,tempDescription);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please field the all fields'))
                      );
                    }
                  }, child: Text('add'))
                ],
              ),
            );
          });
    },
  );


  }
  File? selectedImage;
  String title = '';
  String description = '';
  bool isLiked = false;
  final List<PostModel> posts = [
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1101','flutter developer....',false),
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1102','flutter developer....',false),
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1103','flutter developer....',false),
    PostModel('https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg','Post1104','flutter developer....',false),
  ];
  void  _addPost(String imageUrl, String title, String description){
    setState(() {
     posts.add(PostModel(imageUrl, title, description,isLiked));
     selectedImage = null;
    });
    Navigator.pop(context);
  }
  void liked(int index){
    setState(() {
      posts[index].isLiked=!posts[index].isLiked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Image Grid View',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(icon: Icon(Icons.add),
          onPressed: (){
            _showImagePicker(context);
          },)
        ],
        // InkWell(child: Icon(Icons.add,color: Colors.black,weight: 20,),
        // onTap: ()=>{ _showImagePicker()
        // },)
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4
        ),
            itemCount: posts.length,
            itemBuilder: (ctx, index){
          return Stack(
            children: [Container(
              child: Column(
                children: [
                  Image(image: NetworkImage(
                    posts[index].imageUrl
                  ),
                  ),
                  Text(posts[index].title),
                  Text(posts[index].description)
                ],
              ),
            ),
            Positioned(
                left: 140,
                child: IconButton(
                  icon:Icon(
                  posts[index].isLiked ? Icons.favorite : Icons.favorite_border,
                  color: posts[index].isLiked ? Colors.red : Colors.white,
                  size: 25.0,
                ),
                  onPressed: (){liked(index);},

            )
            )
            ]
          );
            }),
      ),
    );
  }
}
