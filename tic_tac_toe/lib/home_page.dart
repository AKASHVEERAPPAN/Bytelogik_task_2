import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool palyer1 = true;

  int valueX = 0; //value of X
  int valueO = 0; //value of O
  int valueD = 0; // value of Draw

  List input = ["", "", "", "", "", "", "", "", ""];

  void value(int index) {
    setState(() {
      if (palyer1 && input[index] == "") {
        input[index] = "O";
        valueD += 1;
      } else if (!palyer1 && input[index] == "") {
        input[index] = "X";
        valueD += 1;
      }

      palyer1 = !palyer1;

      line();
    });
  }

  void line() {
    if (input[0] == input[1] && input[0] == input[2] && input[0] != "") {
      Win(input[0]);
    } else if (input[3] == input[4] && input[3] == input[5] && input[3] != "") {
      Win(input[3]);
    } else if (input[6] == input[7] && input[6] == input[8] && input[6] != "") {
      Win(input[6]);
    } else if (input[0] == input[3] && input[0] == input[6] && input[0] != "") {
      Win(input[0]);
    } else if (input[1] == input[4] && input[1] == input[7] && input[1] != "") {
      Win(input[1]);
    } else if (input[2] == input[5] && input[2] == input[8] && input[2] != "") {
      Win(input[2]);
    } else if (input[6] == input[4] && input[6] == input[2] && input[6] != "") {
      Win(input[6]);
    } else if (input[0] == input[4] && input[0] == input[8] && input[0] != "") {
      Win(input[0]);
    } else if (valueD == 9) {
      Draw();
    }
  }

  // ignore: non_constant_identifier_names
  void Win(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Winner is :$winner"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      newPlay();
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text('Play Again !'))
            ],
          );
        });

    if (winner == 'O') {
      valueO += 1;
    } else if (winner == 'X') {
      valueX += 1;
    }
  }

  void newPlay() {
    for (int i = 0; i < 9; i++) {
      input[i] = "";
    }

    valueD = 0;
  }

  // ignore: non_constant_identifier_names
  void Draw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Match Draw"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      newPlay();
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text('Play Again !'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Score Board',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('Palyer X',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(valueX.toString(),
                      style: const TextStyle(color: Colors.white))
                ],
              ),
              const SizedBox(
                width: 80,
              ),
              Column(
                children: [
                  const Text('Palyer O',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text(valueO.toString(),
                      style: const TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              height: 500,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        value(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            input[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
