// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, must_be_immutable, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twenty_flutter/utils/db.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({
    super.key,
    required this.img,
    required this.name,
    this.price,
    this.min,
    this.rating,
  });

  String img;
  String name;
  String? price;
  String? min;
  String? rating;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey)],
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 237, 232, 232)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.img, scale: 10),
                ),
              ),
              Text(widget.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("20min",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 105, 103, 103))),
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        size: 18,
                        color: Color.fromARGB(255, 203, 190, 76),
                      ),
                      Text("\$4.5",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 105, 103, 103))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\$12.00",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Positioned(
        right: 1,
        bottom: 1,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.green),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      Positioned(top: 5, right: 10, child: Icon(Icons.favorite_border_outlined))
    ]);
  }
}
