import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/barang.dart';
import 'package:final_project/pages/screens/sell_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

TextEditingController inputNama = TextEditingController();
TextEditingController inputStock = TextEditingController();
TextEditingController inputHarga = TextEditingController();
TextEditingController inputTanggal = TextEditingController();

class AllBarang extends StatefulWidget {
  const AllBarang({Key? key}) : super(key: key);

  @override
  State<AllBarang> createState() => _AllBarangState();
}

class _AllBarangState extends State<AllBarang> {
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventory = firestore.collection('inventory');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text("All Fruits"),
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: StreamBuilder<QuerySnapshot>(
        stream: inventory.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var fruitList = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.7,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, indeks) {
                DocumentSnapshot barang = snapshot.data!.docs[indeks];
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // context.goNamed('sell');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SellScreens(

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 180,
                                  height: 120,
                                  child: Image.asset('images/grapes.png')),
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
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, left: 10.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Per Kg",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
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
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
