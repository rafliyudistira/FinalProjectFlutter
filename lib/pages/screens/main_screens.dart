import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/barang.dart';
import 'package:final_project/pages/screens/all_barang.dart';
import 'package:final_project/pages/screens/sell_screens.dart';
import 'package:final_project/pages/update_barang.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

TextEditingController inputNama = TextEditingController();
TextEditingController inputStock = TextEditingController();
TextEditingController inputHarga = TextEditingController();
TextEditingController inputTanggal = TextEditingController();

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventory = firestore.collection('inventory');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF1E1E1E),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    tooltip: "Back",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      // const Text(
                      //   'Add',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontFamily: 'Inter',
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_business_outlined,
                          color: Colors.white,
                          size: 33,
                        ),
                        onPressed: () {
                          context.goNamed('add');
                        },
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
                padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Image.asset("images/campaigns.png",
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 30.0, right: 20.0),
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
                        context.goNamed('allbarang');
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
            StreamBuilder<QuerySnapshot>(
              stream: inventory.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // var fruitList = snapshot.data;
                  return Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3.5,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, indeks) {
                        print(snapshot.data!.docs.length);
                        DocumentSnapshot barang = snapshot.data!.docs[indeks];
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 5),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                context.goNamed('sell', queryParams: {
                                  "nama": barang['nama_barang'],
                                  "harga": barang['harga'].toString(),
                                  "stock": barang['stock'].toString(),
                                  "id": barang['id'],
                                  "category": barang['category'],
                                });
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SellScreens(
                                //               fruit: barang[indeks],
                                //             )));
                              },
                              child: Card(
                                color: const Color(0xFF2C2C2C),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0))),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          height: 120,
                                          child:
                                              Image.asset('images/grapes.png')),
                                      Column(
                                        children: [
                                          if (barang['stock'] == 0) ...[
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, left: 15.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Stock habis",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 190, 0, 0),
                                                    fontFamily: "Inter",
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ] else ...[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0, left: 15.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Stock ${barang['stock']}",
                                                  style: const TextStyle(
                                                    color: Color(0xFFF1C950),
                                                    fontFamily: "Inter",
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            barang['nama_barang'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Rp.${barang['harga']} ",
                                              style: const TextStyle(
                                                  color: Color(0xFFF1C950),
                                                  fontSize: 25,
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 0),
                                              child: Text(
                                                "${barang['category']} Per Kg",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
