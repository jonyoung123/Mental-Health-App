// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: MentalApp(),
    );
  }
}

class MentalApp extends StatefulWidget {
  const MentalApp({Key? key}) : super(key: key);

  @override
  _MentalAppState createState() => _MentalAppState();
}

class _MentalAppState extends State<MentalApp> {
  double _value = 0;
  String img = "images/mh1.png";
  String text1= "How was your day?";
  String text2 = "Not good";
  Color bgcol = Color.fromARGB(255, 89, 240, 159);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double pad = 0.1 *height;
    double width  = MediaQuery.of(context).size.width;
    double pad1 = 0.05 * width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcol,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: pad1, vertical: pad),
          child: Column(

            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(text1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 5
                      ),),
                    SizedBox(
                      height: 50,
                    ),
                    Text(text2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 5
                      ),)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Image.asset(img),),
              SizedBox(height: 100,),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    activeTickMarkColor: Colors.blue,
                    inactiveTrackColor: Colors.white,
                    inactiveTickMarkColor: Colors.black,
                    trackHeight: 20,
                    thumbColor: bgcol,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)
                ),
                child: Slider(
                  min: 0.0,
                  max: 20.0,
                  divisions: 2,
                  value: _value,
                  onChanged: (newRating){
                    setState(() {
                      _value = newRating;
                      if (_value==0.0) {
                        text1= "How was your day?";
                        text2 = "Not good";
                        img = "images/mh1.png";
                        bgcol = Color.fromARGB(255, 89, 240, 159);
                      }else if (_value==10.0) {
                        text2 = "Fine";
                        img = "images/mh2.jpg";
                        bgcol = Color.fromARGB(255,150,189,255);
                      } else if (_value==20.0) {
                        text2 = "Awesome";
                        img = "images/mh3.jpg";
                        bgcol = Color.fromARGB(255,255,215,81);
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

