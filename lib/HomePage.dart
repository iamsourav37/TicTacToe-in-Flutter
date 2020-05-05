import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

bool isCross = true;
List<String> gameState ;
String message = "";

AssetImage cross = AssetImage("images/cross.png");
AssetImage circle = AssetImage("images/circle.png");
AssetImage edit = AssetImage("images/edit.png");

@override
void initState() {
    super.initState();
    setState(() {
      this.message = "";
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
    });

  }












  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tic-Tac-Toe game by Sourav",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                ),
                itemCount: 9,
                itemBuilder: (context, i) => Container(
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "$message",
                style: TextStyle(
                  fontSize: 20.0,

                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              shape: StadiumBorder(),
              child: Text(
                "Reset Game",
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 2.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text("LearnCodeOnline.in",style: TextStyle(fontSize: 18),),
            )
          ],
        ));
  }
}
