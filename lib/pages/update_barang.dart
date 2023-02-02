import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/sweat_allert.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/services/auth_register.dart';
import 'package:final_project/utils/color_gradient.dart';
import 'package:final_project/validator/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/services/auth_services.dart';
import 'package:lottie/lottie.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Buah"), value: "Buah"),
    DropdownMenuItem(child: Text("Sayur"), value: "Sayur"),
  ];
  return menuItems;
}

final _formKey = GlobalKey<FormState>();
double sideLength = 50;

class UpdateBarang extends StatefulWidget {
  final GoRouterState? goRouterState;

  const UpdateBarang({super.key, required, this.goRouterState});
  @override
  State<UpdateBarang> createState() => _UpdateBarangState();
}

class _UpdateBarangState extends State<UpdateBarang> {
  void click() {}

  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    final String nama = widget.goRouterState!.queryParams['nama'] as String;
    final String harga = widget.goRouterState!.queryParams['harga'] as String;
    final String stock = widget.goRouterState!.queryParams['stock'] as String;
    final String id = widget.goRouterState!.queryParams['id'] as String;
    final String category =
        widget.goRouterState!.queryParams['category'] as String;
    print("rebuild");
    String selectDrop = category;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventory = firestore.collection('inventory');

    final editName = TextEditingController(text: nama);
    final editHarga = TextEditingController(text: harga);
    final editStock = TextEditingController(text: stock);
    final editCategory = TextEditingController(text: category);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          // height: double.maxFinite,
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.purpleAccent,
                Colors.amber,
                Colors.blue,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 30, 0, 0),
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
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                width: 310,
                child: Image.asset("images/grapes.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 440,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Update Data",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextFormField(
                          controller: editName,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                              labelText: "Update Nama",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextFormField(
                          validator: (value) =>
                              Validator.validateName(name: editHarga.text),
                          controller: editHarga,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                              labelText: "Update Harga",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextFormField(
                          validator: (value) =>
                              Validator.validateName(name: editStock.text),
                          controller: editStock,
                          // obscureText: true,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                              labelText: "Update Stock",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 260,
                        height: 60,
                        child: DropdownButtonFormField(
                            value: selectDrop,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            dropdownColor: Colors.white,
                            // value: selectedValue,
                            // onChanged: (value) {},
                            onChanged: (String? newValue) {
                              // setState(() {
                              // });
                              selectDrop = newValue!;
                              print(selectDrop);
                            },
                            items: dropdownItems),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Container(
                      //   width: 260,
                      //   height: 60,
                      //   child: TextFormField(
                      //     validator: (value) =>
                      //         Validator.validateName(name: inputTanggal.text),
                      //     controller: inputTanggal,
                      //     // obscureText: true,
                      //     decoration: const InputDecoration(
                      //         suffix: Icon(
                      //           FontAwesomeIcons.userCheck,
                      //           color: Colors.blue,
                      //         ),
                      //         labelText: "Tanggal",
                      //         border: OutlineInputBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(15)),
                      //         )),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            print(selectDrop);
                            await inventory.doc(id).update({
                              "nama_barang": editName.text,
                              "harga": editHarga.text,
                              "stock": editStock.text,
                              "category": selectDrop,

                              // "tanggal": inputTanggal.text,
                            });
                            updateAlert(context);
                            // context.goNamed('screens');
                            // inputTanggal.clear();
                            // User? user = await AuthRegister.register(
                            //   inventory.add({
                            //     nam
                            //   })
                            // name: inputName.text,
                            // email: inputEmail.text,
                            //     // password: inputPassword.text);
                            // inputName.clear();
                            // inputEmail.clear();
                            // inputPassword.clear();
                            // print(user);
                            // if (user != null) {
                            //   context.go('/login');
                            // }
                          } else {
                            Center(child: CircularProgressIndicator());
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 174, 0, 255),
                                    Color(0xFFE94057),
                                    Color.fromARGB(255, 242, 151, 33),
                                  ])),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       StreamBuilder<QuerySnapshot>(
      //         stream: inventory.snapshots(),
      //         builder: (context, snapshot) {
      //           if (snapshot.hasData) {
      //             return Padding(
      //               padding: EdgeInsets.all(1),
      //               child: Column(
      //                 children: snapshot.data!.docs
      //                     .map(
      //                       (e) => TextFormField(
      //                         // validator: (value) => Validator.validatePassword(
      //                         //     password: authPassword.text),
      //                         controller: editName,
      //                         // obscureText: true,
      //                         style: TextStyle(color: Colors.black),
      //                         decoration: const InputDecoration(
      //                             enabledBorder: OutlineInputBorder(
      //                                 borderSide:
      //                                     BorderSide(color: Colors.black),
      //                                 borderRadius: BorderRadius.all(
      //                                     Radius.circular(15))),
      //                             suffix: Icon(
      //                               FontAwesomeIcons.eyeSlash,
      //                               color: Colors.blue,
      //                             ),
      //                             labelText: "Nama",
      //                             labelStyle: TextStyle(color: Colors.black),
      //                             border: OutlineInputBorder(
      //                               borderRadius:
      //                                   BorderRadius.all(Radius.circular(15)),
      //                             )),
      //                       ),
      //                     )
      //                     .toList(),
      //               ),
      //             );
      //           } else {
      //             return CircularProgressIndicator();
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
