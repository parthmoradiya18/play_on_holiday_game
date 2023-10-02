import 'package:flutter/material.dart';
import 'package:play_on_holiday_game/Data.dart';
import 'package:play_on_holiday_game/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List temp = [];

  @override
  void initState() {
    temp = List.filled(data.img.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.img.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(margin: EdgeInsets.all(5),
              color: Colors.grey,
              child: ListTile(
                title: Text("${data.name[index]}"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('image/${data.img[index]}'),
                ),
              ),
            ),
            onTapDown: (details) {
              setState(() {
                temp[index] = true;
              });
            },
            onTapUp: (details) {
              setState(() {
                temp[index] = false;
                Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Homepage(data.img[index],data.name[index]);
                },));
              });
            },
            onTapCancel: () {
              setState(() {
                temp[index] = false;
              });
            },
          );
        },
      ),
    );
  }
}
