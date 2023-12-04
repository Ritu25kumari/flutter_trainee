import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ritu_trainee/api3_cart_model.dart';
class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  CartResponceModel? cartModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text('Cart list',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          if(cartModel?.carts!=null)
            Expanded(
              child: ListView.builder(
                  itemCount: cartModel!.carts!.length,
                  itemBuilder: (context ,index){
                    final cart = cartModel!.carts![index];
                    return SizedBox(
                      height: 200,
                      child: Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.deepPurple),borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${cart.id}'),
                                // Text('${cart.total}'),
                                // Text('${cart.discountedTotal}'),
                                // Text('${cart.userId}'),
                                // Text('${cart.totalProducts}'),
                                // Text('${cart.totalQuantity}'),
                                if(cart.products!=null)
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: cart.products!.length,
                                        itemBuilder: (context,index){
                                          final cart2=cart.products![index];
                                          return Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('${cart2.id}'),
                                                  Text(cart2.title??'title'),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                            ]
                          ),
                        ),
                        )
                      ),
                    );
                  }),
            )
        ],
      ),
    );
  }
  @override
  void initState(){
    super.initState();
    loadCart();
  }
  void loadCart() async{
    final dio = Dio();
    final cartresponse = await dio.get('https://dummyjson.com/carts');
    cartModel= CartResponceModel.fromJson(cartresponse.data);
    setState(() {
    });
  }
}
