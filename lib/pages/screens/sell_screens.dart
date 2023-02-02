import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/barang.dart';
import 'package:final_project/model/sweat_allert.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SellScreens extends StatefulWidget {
  final GoRouterState? goRouterState;
  // final String nama;
  // final String harga;
  // final String stock;
  SellScreens({
    Key? key,
    this.goRouterState,
  }) : super(key: key);

  @override
  State<SellScreens> createState() => _SellScreensState();
}

class _SellScreensState extends State<SellScreens> {
  @override
  Widget build(BuildContext context) {
    final String nama = widget.goRouterState!.queryParams['nama'] as String;
    final String harga = widget.goRouterState!.queryParams['harga'] as String;
    final String stock = widget.goRouterState!.queryParams['stock'] as String;
    final String id = widget.goRouterState!.queryParams['id'] as String;
    final String category =
        widget.goRouterState!.queryParams['category'] as String;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inventory = firestore.collection('inventory');

    // print(nama);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF1E1E1E),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
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
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_rounded,
                          size: 30.0, color: Colors.white),
                      tooltip: "Cart",
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Text(
                    // "Stock ${data!['stock']}",
                    stock.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.normal,
                      letterSpacing: 5.0,
                      color: Color(0xFFF1C950),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      nama.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 200, child: Image.asset('images/grapes.png')),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    harga.toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 5.0,
                      color: Color(0xFFF1C950),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "PER KG",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 10,
                        fontSize: 25.0),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 320,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('updatebarang', queryParams: {
                      "nama": nama,
                      "harga": harga,
                      "stock": stock,
                      "id": id,
                      "category": category,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFF1C950),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Update",
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 17.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        // <-- Icon
                        Icons.update,
                        size: 24.0,
                        color: Color(0xFF2C2C2C),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 320,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Alert(
                      style: alertStyle,
                      context: context,
                      type: AlertType.warning,
                      title: "Hapus!",
                      desc: "Yakin ingin menghapus?",
                      buttons: [
                        DialogButton(
                          radius: BorderRadius.circular(15),
                          child: Text(
                            "Batal",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 237, 87, 87),
                            Color.fromARGB(255, 199, 125, 52)
                          ]),
                        ),
                        DialogButton(
                          radius: BorderRadius.circular(15),
                          child: Text(
                            "Ya",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            inventory.doc(id).delete();
                            context.goNamed('screens');
                            Navigator.pop(context);
                          },
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(116, 116, 191, 1.0),
                            Color.fromRGBO(52, 138, 199, 1.0)
                          ]),
                        )
                      ],
                    ).show();

                    // showDialog<String>(
                    //   context: context,
                    //   builder: (BuildContext context) => AlertDialog(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(25)),
                    //     backgroundColor: const Color(0xFF2C2C2C),
                    //     title: Column(
                    //       children: [
                    //         SizedBox(
                    //             width: 130,
                    //             child: Image.asset('images/warning.png')),
                    //         const SizedBox(
                    //           height: 20,
                    //         ),
                    //         const Text(
                    //           'Yakin ingin menghapus?',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontFamily: 'Inter',
                    //             fontWeight: FontWeight.w700,
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           height: 10,
                    //         ),
                    //         const Text(
                    //           'Pikirakn dulu...',
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontFamily: 'Inter',
                    //             fontWeight: FontWeight.w700,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     // content: const Text(
                    //     //   'Pikirakn dulu...',
                    //     //   style: TextStyle(
                    //     //     color: Colors.white,
                    //     //     fontFamily: 'Inter',
                    //     //     fontWeight: FontWeight.w700,
                    //     //   ),
                    //     // ),
                    //     actions: <Widget>[
                    //       TextButton(
                    //         onPressed: () => Navigator.pop(context, 'Cancel'),
                    //         child: const Text(
                    //           'Cancel',
                    //           style: TextStyle(
                    //             color: Color(0xFFF1C950),
                    //           ),
                    //         ),
                    //       ),
                    //       TextButton(
                    //         onPressed: () {
                    //           inventory.doc(id).delete();
                    //           context.goNamed('screens');
                    //         },
                    //         child: const Text(
                    //           'OK',
                    //           style: TextStyle(color: Color(0xFFF1C950)),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );

                    // context.goNamed('updatebarang', queryParams: {
                    //   "nama": nama,
                    //   "harga": harga,
                    //   "stock": stock,
                    //   "id": id,
                    // });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFF1C950),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Delete",
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 17.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        // <-- Icon
                        Icons.delete,
                        size: 24.0,
                        color: Color(0xFF2C2C2C),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
