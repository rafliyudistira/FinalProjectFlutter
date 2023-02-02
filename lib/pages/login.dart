import 'package:final_project/pages/home.dart';
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

final authEmail = TextEditingController();
final authPassword = TextEditingController();

final _formKey = GlobalKey<FormState>();
double sideLength = 50;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                height: 50,
              ),
              SizedBox(
                height: 150,
                width: 300,
                child: Image.asset("images/on1.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 450,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 58, 58, 58),
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
                        "Selamat Datang",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Silahkan Login",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 260,
                        height: 60,
                        child: TextFormField(
                          validator: (value) =>
                              Validator.validateEmail(email: authEmail.text),
                          controller: authEmail,
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              // fillColor: Colors.white,
                              // filled: false,
                              suffix: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.blue,
                              ),
                              labelText: "Email Address",
                              labelStyle: TextStyle(color: Colors.white),
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
                              password: authPassword.text),
                          controller: authPassword,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              suffix: Icon(
                                FontAwesomeIcons.eyeSlash,
                                color: Colors.blue,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: click,
                              child: const Text(
                                "Lupa Password?",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            User? user =
                                await AuthServices.loginUsingEmailPassword(
                                    email: authEmail.text,
                                    password: authPassword.text,
                                    context: context);
                            authEmail.clear();
                            authPassword.clear();
                            print(user);
                            if (user != null) {
                              context.go('/home');
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    // Color.fromARGB(255, 174, 0, 255),
                                    // Color(0xFFE94057),
                                    // Color.fromARGB(255, 242, 151, 33),
                                    Color.fromARGB(255, 85, 85, 85),
                                    Color(0xFF1E1E1E),
                                    Color.fromARGB(255, 76, 76, 76)
                                  ])),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        onPressed: () async {
                          context.go("/register");
                        },
                        child: const Text(
                          "Buat Akun?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: click,
                            icon: const Icon(
                              FontAwesomeIcons.facebook,
                              color: Color.fromARGB(255, 62, 107, 255),
                            ),
                          ),
                          IconButton(
                              onPressed: click,
                              icon: const Icon(
                                FontAwesomeIcons.instagram,
                                color: Color.fromARGB(255, 225, 0, 255),
                              )),
                          IconButton(
                              onPressed: click,
                              icon: const Icon(
                                FontAwesomeIcons.github,
                                color: Color.fromARGB(255, 138, 138, 138),
                              )),
                          IconButton(
                              onPressed: click,
                              icon: const Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.green,
                              ))
                        ],
                      )
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

// class LoginPage extends StatefulWidget {
//   // static String tag = 'login-page';
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
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

//     final email = TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       controller: authEmail,
//       autofocus: false,
//       decoration: InputDecoration(
//         hintText: 'Email',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//     );

//     final password = TextFormField(
//       autofocus: false,
//       controller: authPassword,
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
//                 email: authEmail.text,
//                 password: authPassword.text,
//                 context: context);
//             authEmail.clear();
//             authPassword.clear();
//             print(user);
//             if (user != null) {
//               context.go('/home');
//             }
//             // context.goNamed('home'); 
//           },
//           color: Colors.lightBlueAccent,
//           child: Text('Login', style: TextStyle(color: Colors.white)),
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
//           context.go('/register');
//           // context.goNamed('home');
//         },
//         color: Colors.lightBlueAccent,
//         child: Text('Register', style: TextStyle(color: Colors.white)),
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
//           hexStringToColor("FFF32F"),
//           hexStringToColor("F23FFF"),
//           hexStringToColor("FF32FF"),
//           hexStringToColor("FF327F"),
//           // hexStringToColor("CB2B93"),
//           // hexStringToColor("9546C4"),
//           // hexStringToColor("5E61F4"),
//         ])),
//         child: Center(
//           child: ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.only(left: 24.0, right: 24.0),
//             children: <Widget>[
//               logo,
//               SizedBox(height: 10),
//               email,
//               SizedBox(height: 10),
//               password,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   loginButton,
//                   signupButton,
//                 ],
//               ),
//               SizedBox(height: 10),
//               forgotLabel
//               // forgotLabel
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
