import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class CalcWindow extends StatefulWidget {
  const CalcWindow({super.key});

  @override
  State<CalcWindow> createState() => _CalcWindowState();
}

class _CalcWindowState extends State<CalcWindow> {
  var calcField = TextEditingController();
  var total = "0";
  String firsNumber = "0";
  String secondNumber = "0";
  String process = "";
  int len = 0;

  @override
  void initState() {
    super.initState();
    calcField.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: SizedBox(
              width: size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  clipBehavior: Clip.none,
                  enableInteractiveSelection: false,
                  controller: calcField,
                  keyboardType: TextInputType.none,
                  showCursor: false,
                  decoration:
                      InputDecoration(hintText: "0", border: InputBorder.none),
                  style: TextStyle(
                    fontSize: 100 - (len * 3.2),
                    height: 1,
                    color: Colors.white54,
                    decorationColor: Colors.grey,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: size.width / 4.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      process = "AC";
                                      hesapla("AC");
                                      calcField.text = total;
                                    });
                                  },
                                  child: Text(
                                    "AC",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      side: BorderSide(
                                          color: process == "AC"
                                              ? Colors.red
                                              : Colors.white38),
                                      padding: EdgeInsets.all(24),
                                      backgroundColor: Colors.grey.shade400),
                                )),
                            SizedBox(
                                width: size.width / 4.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      process = "+/-";
                                      hesapla("+/-");
                                    });
                                  },
                                  child: Text(
                                    "+/-",
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      side: BorderSide(
                                          color: process == "+/-"
                                              ? Colors.red
                                              : Colors.white38),
                                      padding: EdgeInsets.all(24),
                                      backgroundColor: Colors.grey.shade400),
                                )),
                            SizedBox(
                                width: size.width / 4.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      process = "%";
                                      hesapla("%");
                                    });
                                  },
                                  child: Text(
                                    "%",
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      side: BorderSide(
                                          color: process == "%"
                                              ? Colors.red
                                              : Colors.white38),
                                      padding: EdgeInsets.all(24),
                                      backgroundColor: Colors.grey.shade400),
                                )),
                            SizedBox(
                                width: size.width / 4.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      process = "/";
                                      hesapla("/");
                                    });
                                  },
                                  child: Text(
                                    "/",
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      side: BorderSide(
                                          color: process == "/"
                                              ? Colors.red
                                              : Colors.white38),
                                      padding: EdgeInsets.all(24),
                                      backgroundColor: Colors.orangeAccent),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("7");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "7",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("8");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "8",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("9");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "9",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              process = "X";
                              hesapla("X");
                            },
                            child: Text(
                              "X",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(
                                    color: process == "X"
                                        ? Colors.red
                                        : Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.orangeAccent),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("4");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "4",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("5");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "5",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("6");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "6",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              process = "-";
                              hesapla("-");
                            },
                            child: Text(
                              "-",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(
                                    color: process == "-"
                                        ? Colors.red
                                        : Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.orangeAccent),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("1");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "1",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("2");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "2",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("3");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "3",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              process = "+";
                              hesapla("+");
                            },
                            child: Text(
                              "+",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(
                                    color: process == "+"
                                        ? Colors.red
                                        : Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.orangeAccent),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("0");
                                calcField.text = total;
                              });
                            },
                            child:
                                const Text("0", style: TextStyle(fontSize: 24)),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              ",",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(color: Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.blueGrey),
                          )),
                      SizedBox(
                          width: size.width / 4.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hesapla("=");
                                calcField.text = total;
                              });
                            },
                            child: Text(
                              "=",
                              style: const TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(
                                    color: process == "="
                                        ? Colors.red
                                        : Colors.white38),
                                padding: EdgeInsets.all(24),
                                backgroundColor: Colors.orangeAccent),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void hesapla(val) {
    switch (val) {
      case "AC":
        {
          total = "0";
          firsNumber = "0";
          secondNumber = "0";
          process = "";
          len = 0;
        }
      case "+/-":
        {
          print(val);
          var result = total.startsWith("+");
          print(result);
          if (result && total != "0") {
            total = "+$total";
          }
        }
      case "%":
        {
          firsNumber = total;
          total = "0";
          print(firsNumber);
        }
      case "/":
        {
          firsNumber = total;
          total = "0";
          print(firsNumber);
        }
      case "X":
        {
          firsNumber = total;
          total = "0";
          print(firsNumber);
        }
      case "-":
        {
          firsNumber = total;
          total = "0";
          print(firsNumber);
        }
      case "+":
        {
          firsNumber = total;
          total = "0";
          print(firsNumber);
        }
      case "=":
        {
          secondNumber = total;

          total = "0";
          try {
            var fnumber = int.parse(firsNumber);
            var snumber = int.parse(secondNumber);
            print(
                "First Number $fnumber, İşlem  $process Second Number $snumber");

            switch (process) {
              case "+":
                {
                  print("Buradayız");
                  total = (fnumber + snumber).toString();
                  print("Sonuç $total");
                }
              case "-":
                {
                  total = (fnumber - snumber).toString();
                }

              case "/":
                {
                  total = (fnumber / snumber).toString();
                }
              case "%":
                {
                  total = (fnumber % snumber).toString();
                }
              case "X":
                {
                  total = (fnumber * snumber).toString();
                }
            }
          } catch (e) {
            total = "ERROR";
          }
          print(total);
        }
      case ",":
        {}

      case "0" || "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9":
        {
          if (total.length <= 8) {
            if (total != "0") {
              total += val;
            } else {
              total = val;
            }
            len = total.length;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Maksimum 9 Basamaklı Sayılar")));
          }
        }
    }
  }
}
