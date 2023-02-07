import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/quantity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pendapatan = firestore.collection('pendapatan');
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: pendapatan.doc("orweVnk8x5a80L1GV3Ff").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('invoice')
                      .snapshots(),
                  builder: (context, snapshotIn) {
                    if (snapshotIn.hasData) {
                      var db = snapshotIn.data!.docs;
                      double sum = 0;
                      for (int i = 0; i < db.length; i++) {
                        sum += (db[i]['totalHarga']);
                        print(db[i]['totalHarga']);
                      }
                      pendapatan
                          .doc("orweVnk8x5a80L1GV3Ff")
                          .update({"pendapatan": sum.toString()});
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          color: const Color(0xFF1E1E1E),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 38, 0, 0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/vegetablesFruit.png"),
                                          fit: BoxFit.fill),
                                      color: const Color(0xFF2C2C2C),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      )),
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 180),
                                  width:
                                      MediaQuery.of(context).size.width / 1.25,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 112, 112, 112),
                                        width: 5),
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFF2C2C2C),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 0, 0),
                                        child: Text(
                                            "Haii "
                                            " ${user!.displayName} kamu berhasil login!",
                                            style: GoogleFonts.alike(
                                                fontSize: 15,
                                                color: Colors.white,
                                                // fontStyle: FontStyle.italic,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge)),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Column(
                                        children: [
                                          const Text("Pendapatan kamu",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFF1C950),
                                                // fontStyle: FontStyle.italic,
                                              )),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                              '${snapshot.data!['pendapatan']}',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFF1C950),
                                                // fontStyle: FontStyle.italic,
                                              )),
                                        ],
                                      ),
                                      // Text(" dengan E-mail " " ${user!.email}",
                                      //     style: GoogleFonts.alike(
                                      //         fontSize: 15,
                                      //         color: Colors.white,
                                      //         fontStyle: FontStyle.italic,
                                      //         textStyle: Theme.of(context)
                                      //             .textTheme
                                      //             .displayLarge)),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.goNamed("invoice");
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 400),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        image:
                                                            const DecorationImage(
                                                          image: AssetImage(
                                                              "images/cherry.png"),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xFF2C2C2C),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Invoice",
                                                        style:
                                                            GoogleFonts.alike(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                // fontStyle: FontStyle.italic,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.goNamed("screens");
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 400),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        image:
                                                            const DecorationImage(
                                                          image: AssetImage(
                                                              "images/grapes.png"),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xFF2C2C2C),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Inventory",
                                                        style:
                                                            GoogleFonts.alike(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                // fontStyle: FontStyle.italic,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 30, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.goNamed("statistik");
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 400),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        image:
                                                            const DecorationImage(
                                                          image: AssetImage(
                                                              "images/blueberry.png"),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xFF2C2C2C),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Statistik",
                                                        style:
                                                            GoogleFonts.alike(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                // fontStyle: FontStyle.italic,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.goNamed('riwayat');
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 50),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "images/orange.png")),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xFF2C2C2C),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Riwayat",
                                                        style:
                                                            GoogleFonts.alike(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                // fontStyle: FontStyle.italic,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // context.goNamed('riwayat');
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 50),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "images/strawberry.png")),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xFF2C2C2C),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Kosong",
                                                        style:
                                                            GoogleFonts.alike(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                // fontStyle: FontStyle.italic,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 30, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.goNamed('login');
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 50),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "images/banana.png")),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color(
                                                            0xFF2C2C2C),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Logout",
                                                        style:
                                                            GoogleFonts.alike(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                // fontStyle: FontStyle.italic,
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ));
                    }
                    return CircularProgressIndicator();
                  });
            }
            return CircularProgressIndicator();
          }),
      // bottomNavigationBar: Container(
      //   color: const Color(0xFF2C2C2C),
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(100),
      //       topRight: Radius.circular(100),
      //     ),
      //     color: const Color(0xFF2C2C2C),
      //   ),
      //   width: MediaQuery.of(context).size.width,
      //   height: 80,
      // ),
    );
  }
}
