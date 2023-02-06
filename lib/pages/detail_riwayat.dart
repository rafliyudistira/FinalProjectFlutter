import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/getcollection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class DetailRiwayat extends StatefulWidget {
  final GoRouterState? goRouterState;
  DetailRiwayat({super.key, this.goRouterState});

  @override
  State<DetailRiwayat> createState() => _DetailRiwayatState();
}

class SubCollectionData {
  late final String subCollectionName;
  late final String subCollectionData;

  SubCollectionData(
      {required this.subCollectionName, required this.subCollectionData});
}

final firestoreInstance = FirebaseFirestore.instance;

class _DetailRiwayatState extends State<DetailRiwayat> {
  // List<SubCollectionData> subCollectionData = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _getSubCollectionData();
  // }

  // void _getSubCollectionData() async {
  //   var firestore = FirebaseFirestore.instance;
  //   var subCollection = await firestore
  //       .collection('invoice')
  //       .doc('invoice')
  //       .collection('DaftarBarang')
  //       .get();
  //   for (var doc in subCollection.docs) {
  //     setState(() {
  //       subCollectionData.add(SubCollectionData(
  //           subCollectionName: doc.id,
  //           subCollectionData: doc.get('DaftarBarang')));
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    final String id = widget.goRouterState!.queryParams['id'] as String;
    final String nama =
        widget.goRouterState!.queryParams['nama_pembeli'] as String;
    final String date = widget.goRouterState!.queryParams['date'] as String;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('invoice/${id}/DaftarBarang')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  color: const Color(0xFF1E1E1E),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Row(
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
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Pembelian ${nama}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 700,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1 / 0.78,
                          ),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, indeks) {
                            print(snapshot.data!.docs.length);
                            var data = snapshot.data!.docs[indeks];
                            // DocumentSnapshot invoice =
                            //     snapshot.data!.docs[indeks];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // context.goNamed('detail', queryParams: {
                                    //   "id": snapshot.data!.docs[indeks].id
                                    // });
                                    // print(snapshot.data!.docs[indeks].id);
                                  },
                                  child: Card(
                                    color: const Color(0xFF2C2C2C),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                            bottomLeft: Radius.circular(30.0),
                                            bottomRight:
                                                Radius.circular(30.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //     width: 340,
                                          //     height: 120,
                                          //     child: Image.asset(
                                          //         'images/grapes.png')),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 15.0,
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                date,
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
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       top: 10.0, left: 10.0),
                                          //   child: Align(
                                          //     alignment: Alignment.centerLeft,
                                          //     child: Text(
                                          //       nama,
                                          //       style: const TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 30,
                                          //           fontFamily: "Inter",
                                          //           fontWeight:
                                          //               FontWeight.w700),
                                          //     ),
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 0),
                                              child: Text(
                                                "Belanja",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0, left: 10.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '${data['nama']}',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 30,
                                                    fontFamily: "Inter",
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 10.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Jumlah ${data['jumlah']}",
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
                                            padding: const EdgeInsets.only(
                                                top: 10.0, left: 10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Harga ${data['harga']}",
                                                  style: const TextStyle(
                                                      color: Color(0xFFF1C950),
                                                      fontSize: 25,
                                                      fontFamily: "Inter",
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0),
                                                    child: Text(
                                                      "Invoice Pembelian",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey),
                                                    ),
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
                      )
                    ],
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
