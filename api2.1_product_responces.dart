import 'package:flutter/material.dart';
import 'package:ritu_trainee/api2_product_response_model.dart';
import 'package:dio/dio.dart';
class ProductResponse extends StatefulWidget {
  const ProductResponse({super.key});
  @override
  State<ProductResponse> createState() => _ProductResponseState();
}
class _ProductResponseState extends State<ProductResponse> {
  ProductResponceModel? productResponceModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Product Response',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        children: [
          if(productResponceModel?.products!=null)
            Expanded(child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productResponceModel!.products!.length,
                itemBuilder: (context, index){
                  final product = productResponceModel!.products![index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal,),borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(product.thumbnail??'thumbnail',height: 100,width: 100,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text('${product.id}'),
                                      Text(product.title??'title'),
                                      Text('\$${product.price}'),
                                      Text('${product.discountPercentage}'),
                                      Text('${product.rating}'),
                                      Text('${product.stock}'),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Text(product.category??'category'),
                            Text(product.brand??'brand'),
                            Text(product.description??'description'),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            )
            ),
        ],
      )
    );
  }
  void initState(){
    super.initState();
    loadproduct();
  }
  void loadproduct() async{
    print('list');
    final dio = Dio();
    final responce = await dio.get('https://dummyjson.com/products');
    productResponceModel = ProductResponceModel.fromJson(responce.data);
    setState(() {

    });
    print(productResponceModel);
  }
}
