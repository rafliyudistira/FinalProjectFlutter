import 'dart:math' as math;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/barang.dart';
import 'package:final_project/model/quantity.dart';
import 'package:final_project/model/sweat_allert.dart';
import 'package:final_project/pages/login.dart';
import 'package:final_project/pages/screens/all_barang.dart';
import 'package:final_project/pages/screens/sell_screens.dart';
import 'package:final_project/pages/update_barang.dart';
import 'package:final_project/validator/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class InvoiceScreens extends StatefulWidget {
  InvoiceScreens({super.key});

  @override
  State<InvoiceScreens> createState() => _InvoiceScreensState();
}

final nama = TextEditingController();

class _InvoiceScreensState extends State<InvoiceScreens> {
  @override
  Widget build(BuildContext context) {
    int angka = 0;
    double total = 0;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventory = firestore.collection('inventory');
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Quantity())],
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: inventory.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          // Colors.purpleAccent,
                          // Colors.amber,
                          // Colors.blue,
                          Color(0xFF1E1E1E),
                          Color(0xFF1E1E1E),
                          Color(0xFF1E1E1E)
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(17, 30, 17, 0),
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
                              //  const SizedBox(
                              //     height: 10,
                              //   ),
                              const Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "Invoice",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.refresh,
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                                tooltip: "Refresh",
                                onPressed: () {
                                  setState(() {
                                    total;
                                    nama.clear();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 120,
                        //   width: 300,
                        //   child: Image.asset("images/grapes.png"),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 340,
                          height: 135,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 58, 58, 58),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // const Text(
                                //   "Tambah Invoice",
                                //   style: TextStyle(
                                //       fontSize: 25,
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.white),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 260,
                                  height: 60,
                                  child: TextFormField(
                                    validator: (value) =>
                                        Validator.validateName(name: nama.text),
                                    controller: nama,
                                    style: TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        // fillColor: Colors.white,
                                        // filled: false,
                                        suffix: Icon(
                                          FontAwesomeIcons.pen,
                                          color: Colors.blue,
                                        ),
                                        labelText: "Nama Pembeli",
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        )),
                                  ),
                                ),

                                const SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: [
                                    Consumer<Quantity>(
                                      builder: (context, harga, child) => Text(
                                        "Total Belanja : ${total}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Inter",
                                            fontSize: 20,
                                            color: Color(0xFFF1C950)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tambah Belanja",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.goNamed("cart");
                                },
                                icon: Icon(Icons.add_shopping_cart),
                                color: Color(0xFFF1C950),
                                iconSize: 30,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: MediaQuery.of(context).size.height / 2,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3.5,
                            ),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, indeks) {
                              DocumentSnapshot barang =
                                  snapshot.data!.docs[indeks];
                              if (barang['select'] == true) {
                                // totalBelanja += barang['total'];
                                // print(totalBelanja);
                                var db = snapshot.data!.docs;
                                double sum = 0;
                                for (int i = 0; i < db.length; i++) {
                                  sum += (db[i]['total']);
                                }
                                total = sum;
                                print(sum);
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 5),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () async {},
                                      child: Card(
                                        color: const Color(0xFF2C2C2C),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                                bottomLeft:
                                                    Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Consumer<Quantity>(
                                            builder: (context, value, child) =>
                                                Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: SizedBox(
                                                          width: 100,
                                                          height: 110,
                                                          child: Image.asset(
                                                              'images/grapes.png')),
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        await inventory
                                                            .doc(barang.id)
                                                            .update({
                                                          'select': false,
                                                        });

                                                        total -=
                                                            barang['harga'] *
                                                                (barang['qty'] +
                                                                    1);
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 215, 0, 0),
                                                      iconSize: 30,
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          left: 15.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Stock ${barang['stock']}",
                                                      // "Stock ${value.stock.toString()}",
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFFF1C950),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0, left: 15.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      barang['harga']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFFF1C950),
                                                        fontFamily: "Inter",
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0, left: 10.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      barang['nama_barang'],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 30,
                                                          fontFamily: "Inter",
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Consumer<Quantity>(
                                                  builder:
                                                      (context, qty, child) =>
                                                          Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      barang['qty'] == 0
                                                          ? Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      73,
                                                                      73,
                                                                      73),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              child:
                                                                  const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            20),
                                                                child: Icon(Icons
                                                                    .minimize),
                                                              ),
                                                            )
                                                          : InkWell(
                                                              onTap: (() async {
                                                                await inventory
                                                                    .doc(barang
                                                                        .id)
                                                                    .update({
                                                                  'stock': FieldValue
                                                                      .increment(
                                                                          1),
                                                                  'qty': FieldValue
                                                                      .increment(
                                                                          -1),
                                                                  'total': FieldValue
                                                                      .increment(
                                                                          -barang[
                                                                              'harga'])
                                                                });

                                                                // qty.kurang = 1;
                                                                // qty.kurangHarga =
                                                                //     10000;
                                                                // qty.angkaKurang =
                                                                //     1;
                                                              }),
                                                              //  minus,
                                                              child: Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xFFF1C950),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50)),
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              20),
                                                                  child: Icon(Icons
                                                                      .minimize),
                                                                ),
                                                              ),
                                                            ),
                                                      Container(
                                                        height: 40,
                                                        width: 50,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .transparent),
                                                        child: Center(
                                                            child: Text(
                                                          '${barang['qty']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                        )),
                                                      ),
                                                      barang['stock'] == 0
                                                          ? Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      73,
                                                                      73,
                                                                      73),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              child: const Center(
                                                                  child: Icon(
                                                                      Icons
                                                                          .add)),
                                                            )
                                                          : InkWell(
                                                              onTap: (() async {
                                                                await inventory
                                                                    .doc(barang
                                                                        .id)
                                                                    .update({
                                                                  'stock': FieldValue
                                                                      .increment(
                                                                          -1),
                                                                  'qty': FieldValue
                                                                      .increment(
                                                                          1),
                                                                  'total': barang[
                                                                          'harga'] *
                                                                      (barang['qty'] +
                                                                          1)
                                                                });
                                                                print(barang[
                                                                    'total']);
                                                                qty.hargaPlus =
                                                                    barang['harga'] *
                                                                        barang[
                                                                            'qty'];

                                                                // qty.hargaPlus =
                                                                //     10000;
                                                                // qty.tombolTambah =
                                                                //     1;
                                                                // qty.angkaTambah =
                                                                //     1;
                                                              }),
                                                              // add,
                                                              child: Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xFFF1C950),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50)),
                                                                child: const Center(
                                                                    child: Icon(
                                                                        Icons
                                                                            .add)),
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
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              invoiceAlert(context);
                              FirebaseFirestore.instance
                                  .collection('inventory')
                                  .get()
                                  .then((snapshot) {
                                for (DocumentSnapshot ds in snapshot.docs) {
                                  ds.reference.update({
                                    // 'nama': nama.text,
                                    'qty': 0, //True or false
                                    'select': false,
                                    'total': 0 //Your new value
                                  });
                                }
                              });

                              DateTime date2 = DateTime.now();

                              CollectionReference invoice = FirebaseFirestore
                                  .instance
                                  .collection('invoice');
                              var result = await invoice.add({
                                'totalHarga': total,
                                'nama_pembeli': nama.text,
                                "date":
                                    "${DateFormat('yyyy-MM-dd').format(date2)}",
                              });
                              nama.clear();
                              setState(() {
                                total;
                              });
                              // await invoice.add({'nama_konsumen': nama.text});

                              for (int i = 0;
                                  i < snapshot.data!.docs.length;
                                  i++) {
                                if (snapshot.data!.docs[i]['select'] == true) {
                                  await addSubInvoice(
                                      result.id,
                                      snapshot.data!.docs[i]['nama_barang'],
                                      snapshot.data!.docs[i]['harga']
                                          .toString(),
                                      snapshot.data!.docs[i]['qty'].toString());
                                  print('sukses');
                                }
                                print('error');
                              }
                              print('tambah');
                            } else {
                              const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFF1C950),
                                      Color(0xFFF1C950),
                                      Color(0xFFF1C950)
                                      // Color.fromARGB(255, 174, 0, 255),
                                      // Color(0xFFE94057),
                                      // Color.fromARGB(255, 242, 151, 33),
                                    ])),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Simpan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Padding(
                  padding: const EdgeInsets.only(top: 400),
                  child: Center(child: CircularProgressIndicator()),
                );
              }),
        ),
      ),
    );
  }

  // Future<String?> addInvoice(
  //     double total, String nama, String harga, String qty) async {
  //   CollectionReference invoice =
  //       FirebaseFirestore.instance.collection('invoice');
  //   var result = await invoice.add({'totalHarga': total});

  //   addSubInvoice(result.id, nama, harga, qty);
  //   return 'Success';
  // }

  Future<String?> addSubInvoice(
      String id, String nama, String harga, String qty) async {
    CollectionReference invoice =
        FirebaseFirestore.instance.collection('invoice');
    await invoice
        .doc(id)
        .collection('DaftarBarang')
        .add({'nama': nama, 'harga': harga, 'jumlah': qty});
  }
}
