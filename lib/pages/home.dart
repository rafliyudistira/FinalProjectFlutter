import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF1E1E1E),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 38, 0, 0),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/vegetablesFruit.png"),
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
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 112, 112, 112), width: 5),
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF2C2C2C),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                            "Haii "
                            " ${user!.displayName} kamu berhasil login!",
                            style: GoogleFonts.alike(
                                fontSize: 15,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(" dengan E-mail " " ${user!.email}",
                          style: GoogleFonts.alike(
                              fontSize: 15,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge)),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
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
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("images/cherry.png"),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xFF2C2C2C),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Invoice",
                                        style: GoogleFonts.alike(
                                            fontSize: 15,
                                            color: Colors.white,
                                            // fontStyle: FontStyle.italic,
                                            textStyle: Theme.of(context)
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("images/grapes.png"),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xFF2C2C2C),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Inventory",
                                        style: GoogleFonts.alike(
                                            fontSize: 15,
                                            color: Colors.white,
                                            // fontStyle: FontStyle.italic,
                                            textStyle: Theme.of(context)
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: GestureDetector(
                          onTap: () {
                            // context.goNamed("screens");
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
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "images/blueberry.png"),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xFF2C2C2C),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Statistik",
                                        style: GoogleFonts.alike(
                                            fontSize: 15,
                                            color: Colors.white,
                                            // fontStyle: FontStyle.italic,
                                            textStyle: Theme.of(context)
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            context.go("/login");
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF2C2C2C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF2C2C2C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF2C2C2C),
                                  ),
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
          )),
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
