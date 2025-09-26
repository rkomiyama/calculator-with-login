// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _resultNum = 0;
  int _savedNum = 0;
  String? _opKey;

  void _numPressed(numKey) {
    setState(() {
      if (_resultNum == 0) {
        _resultNum = numKey;
      } else {
        _resultNum = int.parse(_resultNum.toString() + numKey.toString());
      }
    });
  }

  void _clearPressed() {
    setState(() {
      _resultNum = 0;
      _savedNum = 0;
    });
  }

  void _operatorPressed(opKey) {
    setState(() {
      _opKey = opKey;
      _savedNum = _resultNum;
      _resultNum = 0;
    });
  }

  void _equalPressed() {
    setState(() {
      if (_opKey != null) {
        switch(_opKey) {
          case "X":
            _resultNum *= _savedNum;
            break;
          case "÷":
            _resultNum = (_resultNum / _savedNum).toInt();
            break;
          case "+":
            _resultNum += _savedNum;
            break;
          case "-":
            _resultNum = _savedNum - _resultNum;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card.outlined(
                    child: SizedBox(
                        height: 64,
                        width: double.infinity,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                textAlign: TextAlign.right,
                                "$_resultNum",
                                style: TextStyle(
                                    fontSize: 48
                                ))
                        )
                    )
                ),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: SizedBox(
                          height: 64,
                          child: SignOutButton(),
                      )
                      ),
                      Expanded(child: SizedBox(
                          height: 64,
                          child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    _operatorPressed("X");
                                  },
                                  child: Center(child: Text(textAlign: TextAlign.center, "X"))
                              )
                          )
                      )
                      ),
                      Expanded(child: SizedBox(
                          height: 64,
                          child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    _operatorPressed("÷");
                                  },
                                  child: Center(child: Text(textAlign: TextAlign.center, "÷"))
                              )
                          )
                      )
                      ),
                      Expanded(child: SizedBox(
                          height: 64,
                          child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    _operatorPressed("+");
                                  },
                                  child: Center(child: Text(textAlign: TextAlign.center, "+"))
                              )
                          )
                      )
                      ),
                      Expanded(child: SizedBox(
                          height: 64,
                          child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    _operatorPressed("-");
                                  },
                                  child: Center(child: Text(textAlign: TextAlign.center, "-"))
                              )
                          )
                      )
                      ),
                    ]
                ),
                Table(
                  children: <TableRow>[
                    TableRow(
                        children: <Widget>[
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(7);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "7"))
                                      )
                                  )
                              )
                          ),
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(8);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "8"))
                                      )
                                  )
                              )
                          ),
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(9);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "9"))
                                      )
                                  )
                              )
                          )
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(4);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "4"))
                                      )
                                  )
                              )
                          ),
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(5);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "5"))
                                      )
                                  )
                              )
                          ),
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(6);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "6"))
                                      )
                                  )
                              )
                          )
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(1);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "1"))
                                      )
                                  )
                              )
                          ),
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(2);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "2"))
                                      )
                                  )
                              )
                          ),
                          TableCell(
                              child:
                              SizedBox(
                                  height: 64,
                                  width: 32,
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            _numPressed(3);
                                          },
                                          child: Center(child: Text(textAlign: TextAlign.center, "3"))
                                      )
                                  )
                              )
                          )
                        ]
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(child: SizedBox(
                        height: 64,
                        child: Card(
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  _clearPressed();
                                },
                                child: Center(child: Text(textAlign: TextAlign.center, "Clear"))
                            )
                        )
                    )
                    ),
                    Expanded(
                        child: SizedBox(
                            height: 64,
                            child: Card(
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                    splashColor: Colors.blue.withAlpha(30),
                                    onTap: () {
                                      _equalPressed();
                                    },
                                    child: Center(child: Text(textAlign: TextAlign.center, "="))
                                )
                            )
                        )
                    ),
                  ],
                ),
              ]
          ),
        )
    );
  }
}
