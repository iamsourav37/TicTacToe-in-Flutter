import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  List<String> gameState;
  String message = "";
  bool isDisabled = false;

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  @override
  void initState() {
    super.initState();
    setState(() {
      this.message = "CROSS turn";
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

  AssetImage getImage(String value) {
    switch (value) {
      case "empty":
        return this.edit;
      case "cross":
        return this.cross;
      case "circle":
        return this.circle;
    }
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        if(this.isCross){
          this.message = "CROSS turn";
        }else{
          this.message = "CIRCLE turn";
        }
        this.checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      this.message = this.isCross? "CROSS turn" : "CIRCLE turn";
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
        this.isDisabled = false;
    });
  }

  checkWin() {
    // 0 1 2
    // 3 4 5
    // 6 7 8

    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} Wins";
        this.isDisabled = true;

      });
    }
    if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[6]} Wins";
        this.isDisabled = true;

      });
    }
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
        this.isDisabled = true;

      });
    }
    if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} Wins";
        this.isDisabled = true;

      });
    }
    if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
        this.isDisabled = true;

      });
    }
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
        this.isDisabled = true;

      });
    }
    if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[2] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
        this.isDisabled = true;

      });
    }

    if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game draw";
      });
    }
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
                itemBuilder: (context, index) => Container(
                  child: MaterialButton(
                    onPressed: isDisabled?null: (){this.playGame(index);}  ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.white,
                    child: Image(
                      image: this.getImage(this.gameState[index]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "$message".toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            RaisedButton(
              onPressed: resetGame,
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
              child: Text(
                "LearnCodeOnline.in",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ));
  }
}
