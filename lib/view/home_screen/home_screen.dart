// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:twenty_flutter/utils/db.dart';
import 'package:twenty_flutter/view/home_screen/widgets/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.pin_drop),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Mumbai City"),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(187, 237, 235, 235),
                    radius: 15,
                    child: Center(child: Icon(Icons.sort)),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Find the",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: 5),
                  Text("Best",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text("Food",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text("Around You",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.article),
                    hintText: "Search your favourite food",
                    filled: true,
                    fillColor: Color.fromARGB(255, 229, 227, 227),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Find",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Text(
                          "5Km",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {});
                          selectedIndex = index;
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: selectedIndex == index
                                  ? Color.fromARGB(255, 94, 213, 98)
                                  : Color.fromARGB(255, 214, 211, 211)),
                          child: Center(
                              child: Text(
                            dbConstants.categoryList[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          )),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: dbConstants.categoryList.length),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: dbConstants.imageList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => CustomContainer(
                          img: dbConstants.imageList[index],
                          name: dbConstants.nameList[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
