import 'package:final_project/model/barang.dart';
import 'package:final_project/pages/screens/all_barang.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<Barang>> getFruits() async {
    var fruitList = <Barang>[];

    var f1 = Barang(1, "Fruit", "Apple", "images/apple.png", 15.00);
    var f2 = Barang(2, "Fruit", "Banana", "images/banana.png", 23.00);
    var f3 = Barang(3, "Fruit", "BlueBerry", "images/blueberry.png", 24.99);
    var f4 = Barang(4, "Fruit", "Cherry", "images/cherry.png", 9.99);
    var f5 = Barang(5, "Fruit", "Grapes", "images/grapes.png", 20.00);
    var f6 = Barang(6, "Fruit", "Kiwi", "images/kiwi.png", 44.99);
    var f7 = Barang(7, "Fruit", "Mandarin", "images/mandarin.png", 36.50);
    var f8 = Barang(8, "Fruit", "Orange", "images/orange.png", 30.25);
    var f9 = Barang(9, "Fruit", "Pear", "images/pear.png", 28.75);
    var f10 = Barang(10, "Fruit", "Strawberry", "images/strawberry.png", 43.99);

    fruitList.add(f1);
    fruitList.add(f2);
    fruitList.add(f3);
    fruitList.add(f4);
    fruitList.add(f5);
    fruitList.add(f6);
    fruitList.add(f7);
    fruitList.add(f8);
    fruitList.add(f9);
    fruitList.add(f10);

    return fruitList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF1E1E1E),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  tooltip: "Menu",
                  onPressed: () {},
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined,
                          color: Colors.white),
                      tooltip: "Cart",
                      onPressed: () {},
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30.0),
                    //   child: SizedBox(
                    //     width: 50,
                    //     height: 50,
                    //     child: Card(
                    //       semanticContainer: true,
                    //       clipBehavior: Clip.antiAliasWithSaveLayer,
                    //       color: Colors.transparent,
                    //       child: Image.asset(
                    //         "images/kadirProfile.jpg",
                    //         fit: BoxFit.fill,
                    //       ),
                    //       shape: const RoundedRectangleBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(15.0)),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child:
                          Image.asset("images/campaigns.png", fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Fruits",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllBarang()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "View All",
                          style: TextStyle(
                              color: Color(0xFFF1C950),
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFF1C950),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 380.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 175,
                        height: 300,
                        child: Card(
                          color: const Color(0xFF2C2C2C),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(75.0),
                                  topRight: Radius.circular(75.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Image.asset("images/apple.png"),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Fruit",
                                      style: TextStyle(
                                        color: Color(0xFFF1C950),
                                        fontFamily: "Inter",
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 5.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Apple",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15.0),
                                  child: Row(
                                    children: const [
                                      Text(
                                        "\$15.0",
                                        style: TextStyle(
                                            color: Color(0xFFF1C950),
                                            fontSize: 20,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "per Kg",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 175,
                        height: 300,
                        child: Card(
                          color: const Color(0xFF2C2C2C),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(75.0),
                                  topRight: Radius.circular(75.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Image.asset("images/banana.png"),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Fruit",
                                      style: TextStyle(
                                        color: Color(0xFFF1C950),
                                        fontFamily: "Inter",
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 5.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Banana",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15.0),
                                  child: Row(
                                    children: const [
                                      Text(
                                        "\$23.0",
                                        style: TextStyle(
                                            color: Color(0xFFF1C950),
                                            fontSize: 20,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "per Kg",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
