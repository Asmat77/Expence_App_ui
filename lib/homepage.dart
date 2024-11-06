import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
        
              /// Row Monety text and search icon.
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/images (1) expense.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 9,
                      child: Text(
                        "Monety",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                      )),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search_rounded,
                      size: 35,
                    ),
                  )
                ],
              ),
        
              ///Profile name and picture
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  //for image
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage("assets/images/downloadasa.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Morning",
                        style: TextStyle(color: Colors.black.withOpacity(.5)),
                      ),
                      Text(
                        "Asmat Shah",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )),
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "This month",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
        
              /// Colorful Container for Expense detail.
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    color: Color(0xff6574D3),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expense Total",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(
                      "\$ 2,734",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 35,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text("+\$240",
                                  style: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "than last month",
                          style: TextStyle(color: Colors.white.withOpacity(.7)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Expense List",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Tuesday, 14",
                              style: TextStyle(fontSize: 20),
                            )),
                            SizedBox(
                              child: Text("-\$1380",
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xff6574D3),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shop",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Buy new clothes",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.5)),
                                  )
                                ],
                              )),
                              SizedBox(
                                  child: Text(
                                "-\$90",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ))
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.mobile_screen_share_sharp,
                                  color: Colors.amber,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Electronic",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Buy new Iphone 16",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.5)),
                                  )
                                ],
                              )),
                              SizedBox(
                                  child: Text(
                                "-\$1500",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Monday, 13",
                              style: TextStyle(fontSize: 20),
                            )),
                            SizedBox(
                              child: Text("-\$200",
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.car_rental_outlined,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transportation",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Trip to Malang",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.5)),
                                  )
                                ],
                              )),
                              SizedBox(
                                  child: Text(
                                "-\$60",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ))
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.other_houses_outlined,
                                  color: Colors.brown,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "House rent",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Pay house rent",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.5)),
                                  )
                                ],
                              )),
                              SizedBox(
                                  child: Text(
                                "-\$140",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ))
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
