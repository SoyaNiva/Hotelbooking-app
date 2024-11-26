import 'package:flutter/material.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int minutes = 15;
  int seconds = 0;
  late Timer timer;
  Color borderColor = Color(0xFFD91656);
  double borderWidth = 3.0;
  late Timer borderTimer;

  final List<Map<String, dynamic>> hostels = [
    {
      "name": "Sunrise Hostel",
      "location": "Beachside, Goa",
      "price": "INR 5000",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoTyg19n9reECQv8Y2crW6PphVi5h4Vpq1ww&s"
    },
    {
      "name": "Mountain Retreat",
      "location": "Himalayas, Himachal",
      "price": "INR 7000",
      "image":
          "https://q-xx.bstatic.com/xdata/images/hotel/840x460/217323026.jpg?k=0d4a57bb513611b6831edb48604c96e2254a67f45383ed4f3640120697556820&o="
    },
    {
      "name": "City Center Stay",
      "location": "Mumbai City",
      "price": "INR 8000",
      "image":
          "https://q-xx.bstatic.com/xdata/images/hotel/max500/583210587.jpg?k=820f81a622f93062f2e5341850cad39d8c361373a8e461f95ba81ac3e81f1410&o="
    },
    {
      "name": "Jungle Lodge",
      "location": "Kerala Forests",
      "price": "INR 5500",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp_FVeTW1UOF4RjVQYWCImK1movBtKt6-UYg&s"
    },
    {
      "name": "Desert Camp",
      "location": "Thar Desert, Rajasthan",
      "price": "INR 4000",
      "image":
          "https://img.easemytrip.com/EMTHotel-1636553/32/na/lg/27650187_23.jpg"
    },
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
    startBorderAnimation();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds == 0) {
          if (minutes == 0) {
            timer.cancel();
          } else {
            minutes--;
            seconds = 59;
          }
        } else {
          seconds--;
        }
      });
    });
  }

  void startBorderAnimation() {
    borderTimer = Timer.periodic(Duration(milliseconds: 700), (timer) {
      setState(() {
        borderColor = borderColor == Color(0xFFD91656)
            ? Colors.orange
            : Color(0xFFD91656);
        borderWidth = borderWidth == 3.0 ? 5.0 : 3.0;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    borderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FF),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFD91656),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deal In Progress",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            AnimatedContainer(
              duration: Duration(milliseconds: 700),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor, width: borderWidth),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Best Offer:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "INR 3500",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD91656),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.timer,
                                color: Color.fromARGB(255, 231, 175, 8)),
                            SizedBox(width: 8),
                            Text(
                              "Offer ends in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/5952/5952689.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Hotels",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: hostels.map((hostel) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(hostel["image"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hostel["name"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                hostel["location"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                hostel["price"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD91656),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 14,
                            ),
                          ),
                          child: Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
