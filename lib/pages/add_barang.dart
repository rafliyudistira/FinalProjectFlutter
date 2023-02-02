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

final inputName = TextEditingController();
final inputHarga = TextEditingController();
final inputStock = TextEditingController();
final inputTanggal = TextEditingController();

String selectDrop = "Buah";

final _formKey = GlobalKey<FormState>();
double sideLength = 50;

class AddBarang extends StatefulWidget {
  @override
  State<AddBarang> createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  void click() {}

  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventory = firestore.collection('inventory');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                        "Tambah Data",
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
                          validator: (value) =>
                              Validator.validateName(name: inputName.text),
                          controller: inputName,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                              labelText: "Nama Data",
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
                              Validator.validateName(name: inputName.text),
                          controller: inputHarga,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                              labelText: "Harga",
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
                              Validator.validateName(name: inputStock.text),
                          controller: inputStock,
                          // obscureText: true,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                              labelText: "Stock",
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
                              setState(() {
                                selectDrop = newValue!;
                              });
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
                      //   height: 10,
                      // ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            var user = FirebaseAuth.instance.currentUser!.uid;
                            sweatAlert(context);
                            var docid = await inventory.add({
                              "nama_barang": inputName.text,
                              "harga": inputHarga.text,
                              "stock": inputStock.text,
                              "category": selectDrop,
                              "date": "${DateTime.now()}",
                            }).then((value) => value.id);
                            inventory.doc(docid).set(
                              {"id": docid},
                              SetOptions(
                                merge: true,
                              ),
                            );
                            inputName.clear();
                            inputHarga.clear();
                            inputStock.clear();
                            inputTanggal.clear();
                            // context.goNamed('screens');
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
                              'Tambah',
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
    );
  }
}
