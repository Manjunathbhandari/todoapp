import 'package:flutter/material.dart';
import 'package:todoapp/screens/dashboard.dart';

import '../utils/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String name = "";

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DashboardPage(
                name: name,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Material(
          color: const Color.fromARGB(255, 240, 240, 240),
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/Shape.png', height: 130),
                ),
                const SizedBox(height: 10),
                const Text("Welcome Onboard!",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Color.fromARGB(255, 39, 39, 39))),
                const SizedBox(height: 15),
                const Text(
                  "Let's help you to meet your task!",
                  style: TextStyle(
                    fontFamily: 'Poppins regular',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            hintText: "Enter Your Full Name",
                            hintStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            hintText: "Enter Your Email",
                            hintStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty.";
                          } else if (value.length < 5) {
                            return "Password must be at least 5 characters.";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            hintText: "Enter Your Password",
                            hintStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (value) {
                          if (value != _passwordController.value.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            hintText: "Confirm Your Password",
                            hintStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                InkWell(
                    onTap: (() => {moveToHome(context)}),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 80, 195, 202)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 115, right: 115, bottom: 15, top: 15),
                        child: Text(
                          "Registers",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have Account ? ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 99, 99),
                              fontFamily: 'Poppins Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      InkWell(
                          onTap: (() => Navigator.pushNamed(
                              context, MyRoutes.loginRoute)),
                          child: const Text("Sign In",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 80, 195, 202),
                                  fontFamily: 'Poppins Regular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16))),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
