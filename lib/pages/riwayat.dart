import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/getcollection.dart';
import 'package:final_project/model/sweat_allert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

final firestoreInstance = FirebaseFirestore.instance;

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inpoice = firestore.collection('invoice');
    Future<void> deleteAllTaskDocs() {
      return inpoice
          .doc(invoice.id)
          .collection('DaftarBarang')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
    }

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: inpoice.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                color: const Color(0xFF1E1E1E),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 20),
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
                          const Text(
                            'Riwayat',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    StreamBuilder<QuerySnapshot>(
                      stream: inpoice.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // var fruitList = snapshot.data;
                          return Container(
                            height: 700,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1 / 0.9,
                              ),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, indeks) {
                                print(snapshot.data!.docs.length);
                                DocumentSnapshot invoice =
                                    snapshot.data!.docs[indeks];
                                // Timestamp dateFirst =
                                //     invoice['date'] as Timestamp;
                                // DateTime dateTwo = dateFirst.toDate();
                                // final date =
                                //     DateFormat('dd-MM-yyyy').format(dateTwo);
                                // print(dateFirst);
                                // void tanggal() {
                                //   final filterMonth =
                                //       DateFormat('MM').format(dateTwo);
                                //   switch (filterMonth) {
                                //     case '01':
                                //       {
                                //         print('January');
                                //       }

                                //       break;
                                //     case '02':
                                //       {
                                //         print('February');
                                //       }

                                //       break;
                                //     default:
                                //   }
                                // }

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 5),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        context.goNamed('detail', queryParams: {
                                          "id": snapshot.data!.docs[indeks].id,
                                          "date": invoice['date'],
                                          "nama_pembeli":
                                              invoice['nama_pembeli'],
                                        });
                                        print(snapshot.data!.docs[indeks].id);
                                      },
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
                                              const EdgeInsets.only(top: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  width: 340,
                                                  height: 120,
                                                  child: Image.asset(
                                                      'images/grapes.png')),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0, left: 10.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${invoice['date']}",
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
                                                    top: 10.0, left: 10.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    '${invoice['nama_pembeli']}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
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
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Total ${invoice['totalHarga']}",
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFFF1C950),
                                                              fontSize: 25,
                                                              fontFamily:
                                                                  "Inter",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              // IconButton(
                                                              //     onPressed:
                                                              //         () {},
                                                              //     icon: Icon(Icons
                                                              //         .update),
                                                              //     color: Color(
                                                              //         0xFFF1C950),
                                                              //     iconSize: 30),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Alert(
                                                                      style:
                                                                          alertStyle,
                                                                      context:
                                                                          context,
                                                                      type: AlertType
                                                                          .warning,
                                                                      title:
                                                                          "Hapus!",
                                                                      desc:
                                                                          "Yakin ingin menghapus?",
                                                                      buttons: [
                                                                        DialogButton(
                                                                          radius:
                                                                              BorderRadius.circular(15),
                                                                          child:
                                                                              Text(
                                                                            "Batal",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 20),
                                                                          ),
                                                                          onPressed: () =>
                                                                              Navigator.pop(context),
                                                                          color: Color.fromRGBO(
                                                                              0,
                                                                              179,
                                                                              134,
                                                                              1.0),
                                                                          gradient:
                                                                              LinearGradient(colors: [
                                                                            Color.fromARGB(
                                                                                255,
                                                                                237,
                                                                                87,
                                                                                87),
                                                                            Color.fromARGB(
                                                                                255,
                                                                                199,
                                                                                125,
                                                                                52)
                                                                          ]),
                                                                        ),
                                                                        DialogButton(
                                                                          radius:
                                                                              BorderRadius.circular(15),
                                                                          child:
                                                                              Text(
                                                                            "Ya",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 20),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            inpoice.doc(invoice.id).delete();
                                                                            inpoice.doc(invoice.id).collection('DaftarBarang').get().then((QuerySnapshot
                                                                                querySnapshot) {
                                                                              querySnapshot.docs.forEach((doc) {
                                                                                doc.reference.delete();
                                                                              });
                                                                            });

                                                                            // inpoice.doc(invoice.id).delete();
                                                                            // inventory.doc(id).delete();
                                                                            // context.goNamed('screens');
                                                                            Navigator.pop(context);
                                                                          },
                                                                          gradient:
                                                                              LinearGradient(colors: [
                                                                            Color.fromRGBO(
                                                                                116,
                                                                                116,
                                                                                191,
                                                                                1.0),
                                                                            Color.fromRGBO(
                                                                                52,
                                                                                138,
                                                                                199,
                                                                                1.0)
                                                                          ]),
                                                                        )
                                                                      ],
                                                                    ).show();
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .delete),
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          222,
                                                                          0,
                                                                          0),
                                                                  iconSize: 30),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 0),
                                                        child: Text(
                                                          "Tap for detail",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.grey),
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
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5, right: 5),
                    //   child: Column(
                    //       children: snapshot.data!.docs
                    //           .map((e) => Padding(
                    //                 padding: const EdgeInsets.only(top: 5),
                    //                 child: Card(
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(15)),
                    //                   child: ListTile(
                    //                     leading: CircleAvatar(
                    //                       backgroundColor: Colors.blue,
                    //                       child: Text(e['nama_pembeli'][0],
                    //                           style: TextStyle(
                    //                               color: Colors.white)),
                    //                     ),
                    //                     title: Text(e['nama_pembeli']),
                    //                     subtitle: Text(e['date']),
                    //                     trailing: Row(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         IconButton(
                    //                           onPressed: (() {
                    //                             // editName.text = e['name'];
                    //                             // editEmail.text = e['email'];
                    //                             showDialog(
                    //                                 context: context,
                    //                                 builder: (BuildContext
                    //                                         context) =>
                    //                                     AlertDialog(
                    //                                       title: const Text(
                    //                                         'Update User',
                    //                                         textAlign: TextAlign
                    //                                             .center,
                    //                                       ),
                    //                                       content: Form(
                    //                                         // key: _formKey,
                    //                                         child: Column(
                    //                                           mainAxisSize:
                    //                                               MainAxisSize
                    //                                                   .min,
                    //                                           children: [
                    //                                             TextFormField(
                    //                                               validator:
                    //                                                   (value) {
                    //                                                 if (value ==
                    //                                                         null ||
                    //                                                     value
                    //                                                         .isEmpty) {
                    //                                                   return "Name cannot be empty";
                    //                                                 }
                    //                                                 return null;
                    //                                               },
                    //                                               // controller: editName,
                    //                                               decoration:
                    //                                                   InputDecoration(
                    //                                                 border:
                    //                                                     OutlineInputBorder(),
                    //                                                 labelText:
                    //                                                     'Nama',
                    //                                               ),
                    //                                             ),
                    //                                             SizedBox(
                    //                                               height: 10,
                    //                                             ),
                    //                                             TextFormField(
                    //                                               // validator: (value) {
                    //                                               //   if (value == null ||
                    //                                               //       value.isEmpty) {
                    //                                               //     return "Email cannot be empty";
                    //                                               //   }
                    //                                               //   if (!EmailValidator
                    //                                               //       .validate(value)) {
                    //                                               //     return "Please insert correct email";
                    //                                               //   }
                    //                                               //   return null;
                    //                                               // },
                    //                                               // controller: editEmail,
                    //                                               decoration:
                    //                                                   InputDecoration(
                    //                                                 border:
                    //                                                     OutlineInputBorder(),
                    //                                                 labelText:
                    //                                                     'Email',
                    //                                               ),
                    //                                             ),
                    //                                           ],
                    //                                         ),
                    //                                       ),
                    //                                       actions: <Widget>[
                    //                                         Row(
                    //                                           mainAxisAlignment:
                    //                                               MainAxisAlignment
                    //                                                   .spaceAround,
                    //                                           children: [
                    //                                             TextButton(
                    //                                               onPressed: () =>
                    //                                                   Navigator.pop(
                    //                                                       context,
                    //                                                       'Cancel'),
                    //                                               child:
                    //                                                   const Text(
                    //                                                 'Cancel',
                    //                                               ),
                    //                                             ),
                    //                                             TextButton(
                    //                                               onPressed:
                    //                                                   () async {
                    //                                                 // await users
                    //                                                 //     .doc(e.id)
                    //                                                 //     .update({
                    //                                                 //   'name': editName.text,
                    //                                                 //   'email': editEmail.text,
                    //                                                 // });
                    //                                                 // editName.clear();
                    //                                                 // editEmail.clear();
                    //                                                 // Navigator.pop(context);
                    //                                               },
                    //                                               child:
                    //                                                   const Text(
                    //                                                       'OK'),
                    //                                             ),
                    //                                           ],
                    //                                         )
                    //                                       ],
                    //                                     ));
                    //                           }),
                    //                           icon: Icon(Icons.edit),
                    //                         ),
                    //                         IconButton(
                    //                           icon: Icon(Icons.delete),
                    //                           onPressed: () {
                    //                             showDialog(
                    //                               context: context,
                    //                               builder:
                    //                                   (BuildContext context) =>
                    //                                       AlertDialog(
                    //                                 title: Text(
                    //                                     'Yakin Ingin Menghapus?'),
                    //                                 content: Text(
                    //                                     'Pikirin dulu ya...'),
                    //                                 actions: [
                    //                                   ElevatedButton(
                    //                                     onPressed: () {
                    //                                       Navigator.pop(
                    //                                           context);
                    //                                     },
                    //                                     child: Text('CANCEL'),
                    //                                   ),
                    //                                   ElevatedButton(
                    //                                     onPressed: () async {
                    //                                       // await users.doc(e.id).delete();
                    //                                       // Navigator.pop(context);
                    //                                     },
                    //                                     child: Text('ACCEPT'),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             );
                    //                           },
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ))
                    //           .toList()
                    //           ),
                    // ),
                    // Center(
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 350),
                    //         child: IconButton(
                    //           onPressed: () {
                    //             subCollection();
                    //           },
                    //           icon: Icon(Icons.get_app),
                    //           color: Color(0xFFF1C950),
                    //           iconSize: 70,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
