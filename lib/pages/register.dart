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

final inputName = TextEditingController();
final inputEmail = TextEditingController();
final inputPassword = TextEditingController();

final _formKey = GlobalKey<FormState>();
double sideLength = 50;

class RegisterPages extends StatefulWidget {
  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  void click() {}

  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
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
                height: 50,
              ),
              SizedBox(
                height: 150,
                width: 300,
                child: Image.asset("images/colab.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 450,
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
                        height: 30,
                      ),
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Silahkan Daftar",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
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
                                FontAwesomeIcons.user,
                                color: Colors.blue,
                              ),
                              labelText: "Name",
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
                              Validator.validateEmail(email: inputEmail.text),
                          controller: inputEmail,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.blue,
                              ),
                              labelText: "Email Address",
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
                          validator: (value) => Validator.validatePassword(
                              password: inputPassword.text),
                          controller: inputPassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                              suffix: Icon(
                                FontAwesomeIcons.eyeSlash,
                                color: Colors.blue,
                              ),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            User? user = await AuthRegister.register(
                                name: inputName.text,
                                email: inputEmail.text,
                                password: inputPassword.text);
                            // User? user = await AuthRegister.register(
                            //     name: inputName.text,
                            //     email: inputEmail.text,
                            //     password: inputPassword.text);
                            inputName.clear();
                            inputEmail.clear();
                            inputPassword.clear();
                            print(user);
                            if (user != null) {
                              context.go('/login');
                            }
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
                              'Daftar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      TextButton(
                        onPressed: () async {
                          context.go("/login");
                        },
                        child: const Text(
                          "Sudah punya Akun?",
                          style: TextStyle(fontWeight: FontWeight.bold),
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

// import 'package:final_project/pages/home.dart';
// import 'package:final_project/services/auth_controller.dart';
// import 'package:final_project/services/auth_register.dart';
// import 'package:final_project/utils/color_gradient.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:go_router/go_router.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:final_project/services/auth_services.dart';

// final inputName = TextEditingController();
// final inputEmail = TextEditingController();
// final inputPassword = TextEditingController();

// class RegisterPages extends StatefulWidget {
//   // static String tag = 'login-page';
//   const RegisterPages({super.key});

//   @override
//   State<RegisterPages> createState() => _RegisterPagesState();
// }

// class _RegisterPagesState extends State<RegisterPages> {
//   @override
//   Widget build(BuildContext context) {
//     final logo = Hero(
//       tag: 'hero',
//       child: Image.asset(
//         'images/foto.png',
//         width: 200,
//         height: 200,
//       ),
//     );

//     final name = TextFormField(
//       keyboardType: TextInputType.name,
//       controller: inputName,
//       autofocus: false,
//       decoration: InputDecoration(
//         hintText: 'Name',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//     );

//     final email = TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       controller: inputEmail,
//       autofocus: false,
//       decoration: InputDecoration(
//         hintText: 'Email',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//     );

//     final password = TextFormField(
//       autofocus: false,
//       controller: inputPassword,
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//     );

//     final loginButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(30.0),
//         shadowColor: Colors.lightBlueAccent.shade100,
//         elevation: 5.0,
//         child: MaterialButton(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           minWidth: 200.0,
//           height: 42.0,
//           onPressed: () async {
//             User? user = await AuthServices.loginUsingEmailPassword(
//                 email: inputEmail.text,
//                 password: inputPassword.text,
//                 context: context);
//             print(user);
//             if (user != null) {
//               context.go('/home');
//             }
//             // context.goNamed('home');
//           },
//           color: Colors.lightBlueAccent,
//           child: Text('Masuk', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//     );

//     final signupButton = Material(
//       borderRadius: BorderRadius.circular(30.0),
//       shadowColor: Colors.lightBlueAccent.shade100,
//       elevation: 5.0,
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         minWidth: 200.0,
//         height: 42.0,
//         onPressed: () async {
//           User? user = await AuthRegister.register(
//               name: inputName.text,
//               email: inputEmail.text,
//               password: inputPassword.text);
//           inputName.clear();
//           inputEmail.clear();
//           inputPassword.clear();
//           print(user);
//           if (user != null) {
//             context.go('/login');
//           }
//           // User? user = await AuthServices.loginUsingEmailPassword(
//           //     email: inputEmail.text,
//           //     password: inputPassword.text,
//           //     context: context);
//           // print(user);
//           // if (user != null) {
//           //   context.go('/home');
//           // }
//           // context.goNamed('home');
//         },
//         color: Colors.lightBlueAccent,
//         child: Text('Daftar', style: TextStyle(color: Colors.white)),
//       ),
//     );

//     final forgotLabel = TextButton(
//       child: Text(
//         'Lupa password?',
//         style: TextStyle(color: Colors.white),
//       ),
//       onPressed: () {},
//     );

//     return Scaffold(
//       // backgroundColor: Colors.blue,
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           // hexStringToColor("FFF32F"),
//           // hexStringToColor("F23FFF"),
//           // hexStringToColor("FF32FF"),
//           // hexStringToColor("FF327F"),
//           hexStringToColor("CB2B93"),
//           hexStringToColor("9546C4"),
//           hexStringToColor("5E61F4"),
//         ])),
//         child: Center(
//           child: ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.only(left: 24.0, right: 24.0),
//             children: <Widget>[
//               logo,
//               SizedBox(height: 10),
//               name,
//               SizedBox(height: 10),
//               email,
//               SizedBox(height: 10),
//               password,
//               SizedBox(
//                 height: 10,
//               ),
//               signupButton,
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     loginButton,
//               //     signupButton,
//               //   ],
//               // ),
//               SizedBox(height: 10),
//               // forgotLabel
//               // forgotLabel
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
