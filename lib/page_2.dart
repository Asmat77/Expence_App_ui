import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              /// first
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Statistic",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("This month"),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),

              ///second
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff6574D3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total expense",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          padding: EdgeInsets.all(6),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white),
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white),
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$3734",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Text(
                          "  / \$4000 per month",
                          style: TextStyle(color: Colors.white.withOpacity(.6)),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(.5),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Container(
                          height: 10,
                          width: 280,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              /// third
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expense Breakdown",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Limit \$900 / weak",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Week"),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),

              ///Forth
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment(-.34, -.66),
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 23,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(child: Text("\$900"))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("\$600"),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("\$300"),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("\$300"),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("\$0"),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 40,
                                  decoration: myDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$640",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("W1")
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 110,
                                  width: 40,
                                  decoration: myDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$850",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("W1")
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 40,
                                  decoration: myDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$622",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("W1")
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.red),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$960",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("W1")
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 40,
                                  decoration: myDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$732",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("W1")
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Fifth
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spending details",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text("your expenses are divided into 5 categories"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 40,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            color: Color(0xff6774D3),
                          )),
                      Expanded(
                          flex: 25,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            color: Color(0xffE98BBD),
                          )),
                      Expanded(
                          flex: 15,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            color: Color(0xffECC68F),
                          )),
                      Expanded(
                          flex: 10,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            color: Color(0xff65C2DA),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            color: Color(0xffD96667),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            color: Color(0xff65DA93),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 40,
                          child: Text(
                            "40%",
                            style: TextStyle(fontSize: 10),
                          )),
                      Expanded(
                          flex: 25,
                          child: Text("25%", style: TextStyle(fontSize: 10))),
                      Expanded(
                          flex: 15,
                          child: Text("15%", style: TextStyle(fontSize: 10))),
                      Expanded(
                          flex: 10,
                          child: Text("10%", style: TextStyle(fontSize: 10))),
                      Expanded(
                          flex: 5,
                          child: Text("5%", style: TextStyle(fontSize: 10))),
                      Expanded(
                          flex: 5,
                          child: Text("5%", style: TextStyle(fontSize: 10))),
                    ],
                  )
                ],
              ),

              
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration myDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(6), color: Colors.blue);
  }
}
