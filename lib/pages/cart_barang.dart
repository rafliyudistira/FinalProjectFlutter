import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/barang.dart';
import 'package:final_project/pages/screens/all_barang.dart';
import 'package:final_project/pages/screens/sell_screens.dart';
import 'package:final_project/pages/update_barang.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quantity_input/quantity_input.dart';

TextEditingController inputNama = TextEditingController();
TextEditingController inputTanggal = TextEditingController();
TextEditingController itemBeli = TextEditingController();
TextEditingController total = TextEditingController();

class CartBarang extends StatefulWidget {
  CartBarang({super.key});

  @override
  State<CartBarang> createState() => _CartBarangState();
}

class _CartBarangState extends State<CartBarang> {
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
                  // Row(
                  //   children: [
                  //     // const Text(
                  //     //   'Add',
                  //     //   style: TextStyle(
                  //     //     color: Colors.white,
                  //     //     fontFamily: 'Inter',
                  //     //     fontWeight: FontWeight.w700,
                  //     //   ),
                  //     // ),
                  //     // IconButton(
                  //     //   icon: const Icon(
                  //     //     Icons.post_add_rounded,
                  //     //     color: Colors.white,
                  //     //     size: 33,
                  //     //   ),
                  //     //   onPressed: () {
                  //     //     context.goNamed('add');
                  //     //   },
                  //     // ),
                  //     // Padding(
                  //     //   padding: const EdgeInsets.only(left: 30.0),
                  //     //   child: SizedBox(
                  //     //     width: 50,
                  //     //     height: 50,
                  //     //     child: Card(
                  //     //       semanticContainer: true,
                  //     //       clipBehavior: Clip.antiAliasWithSaveLayer,
                  //     //       color: Colors.transparent,
                  //     //       child: Image.asset(
                  //     //         "images/kadirProfile.jpg",
                  //     //         fit: BoxFit.fill,
                  //     //       ),
                  //     //       shape: const RoundedRectangleBorder(
                  //     //         borderRadius:
                  //     //             BorderRadius.all(Radius.circular(15.0)),
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //     // )
                  //   ],
                  // ),
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
                              onTap: () async {
                                // await inventory.doc(barang.id).update({
                                //   'select': true,
                                //   'qty': 1,
                                //   "total": barang['harga']
                                // });
                                // context.goNamed('sell', queryParams: {
                                //   "nama": barang['nama_barang'],
                                //   "harga": barang['harga'],
                                //   "stock": barang['stock'],
                                //   "id": barang['id'],
                                // });
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
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          barang['stock'] == 0
                                              ? IconButton(
                                                  onPressed: () {
                                                    // await inventory
                                                    //     .doc(barang.id)
                                                    //     .update({
                                                    //   'select': true,
                                                    //   'qty': 1,
                                                    //   "total": barang['harga']
                                                    // });
                                                  },
                                                  icon: Icon(
                                                      Icons.add_shopping_cart),
                                                  color: Color.fromARGB(
                                                      255, 84, 84, 84),
                                                  iconSize: 30,
                                                )
                                              : IconButton(
                                                  onPressed: () async {
                                                    await inventory
                                                        .doc(barang.id)
                                                        .update({
                                                      'select': true,
                                                      'qty': 1,
                                                      "total": barang['harga']
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.add_shopping_cart),
                                                  color: Color(0xFFF1C950),
                                                  iconSize: 30,
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                          width: 160,
                                          height: 100,
                                          child:
                                              Image.asset('images/grapes.png')),
                                      barang['stock'] == 0
                                          ? const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, left: 15.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Stock habis",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 200, 0, 0),
                                                    fontFamily: "Inter",
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, left: 15.0),
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
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.0),
                                              child: Text(
                                                "Per Kg",
                                                style: TextStyle(
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
