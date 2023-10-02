import 'package:flutter/material.dart';
import 'package:play_on_holiday_game/main.dart';

class Homepage extends StatefulWidget {
  String curind = "";
  String name = "";

  Homepage(this.curind, this.name);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.name}"),
          backgroundColor: Colors.lightGreen,
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Rate Us")),
                      PopupMenuItem(child: Text("Share")),
                    ])
          ],
        ),
        drawer: Drawer(
            backgroundColor: Colors.lightGreen,
            child: Column(
              children: [
                UserAccountsDrawerHeader(margin: EdgeInsets.all(5),
                    arrowColor: Colors.black,
                    accountName: Text("PARTH MORADIYA"),
                    accountEmail: Text("parthpatel23598@gmail.com")),

                IconButton(onPressed: () {
                  Navigator.pop(context);
                  setState(() {

                  });
                }, icon: Icon(Icons.share)),
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  },));
                }, icon: Icon(Icons.home)),
              ],
            ),

        ),

        floatingActionButton: FloatingActionButton(child: Icon(Icons.home),
          backgroundColor: Colors.red,onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Home();
          },));
        },),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 400,
                width: double.infinity,
                color: Colors.grey,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image(image: AssetImage("image/${widget.curind}")),
                ),
              ),
            ),
          ],
        ));
  }
}
