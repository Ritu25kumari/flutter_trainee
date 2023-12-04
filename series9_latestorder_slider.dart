import 'package:flutter/material.dart';

class Order {
  final int id;
  final String Address;

  Order({
    required this.id,
    required this.Address,
  });
}
class LatestOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final List<Order> orders = [
    Order(
      id: 507,
      Address: "New Times Square",
    ),
    Order(
      id: 536,
      Address: "Victoria Square",
    )
  ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      RichText(
                        text:TextSpan(
                          children: [
                            TextSpan(text: "${orders[index].id},\n"),
                            TextSpan(text: orders[index].Address)
                          ]
                        )

                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15.0,
              );
            },
            itemCount: orders.length,
          )
          // Let's create an order model
        ],
      ),
    );
  }
}