import 'package:flutter/material.dart';
import 'dart:ui';
class Location {
  final String address;
  final String state;
  final Color color;
  Location({
    required this.address,
    required this.state,
    required this.color,
  });
}
class LocationSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double locationwidth = 150;
    List<Location> locations = [
      Location(
        address: "Sector 59",
        state: "Mohali",
        color: Colors.orange
      ),
      Location(
        address: "Ludhiana",
        state: "Punjab",
        color: Colors.purple
      ),
      Location(
        address: "Hanumangarh",
        state: "Rajsthan",
        color: Colors.blue,
      ),
    ];
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: locations.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
          final location1=locations[index];
         return Container(
           decoration: BoxDecoration(
             color: location1.color,
             borderRadius: BorderRadius.circular(8)
           ),
            width: locationwidth,
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                         horizontal: 12.0,
                      ),
           child: Column(
             children: [
               Text(location1.address,style: TextStyle(color: Colors.white,fontSize: 18),),
               Text(location1.state,style:TextStyle(color: Colors.white,fontSize: 18),)
             ],
           ),
         );
        }),
    );
  }
}