import 'package:flutter/material.dart';
import 'package:todoapp/screens/dashboard.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/Shape.png',
                      height: 130,
                    )),
                const Text("Welcome Back!",
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Align(
                      alignment: const Alignment(0.25, 1),
                      child: Image.asset(
                          'assets/images/undraw_add_tasks_mxew 1.png')),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
                            hintText: "Enter Your Full Name",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            hintStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User name cannot be empty.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 13,
                      ),
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
                            hintText: "Enter Your Password",
                            hintStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13),
                          ),
                          obscureText: true,
                          obscuringCharacter: "*",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty.";
                            } else if (value.length < 5) {
                              return "Password must be at least 5 characters.";
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.forgotPasswordRoute);
                  },
                  child: const Text("Forgot Password?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 74, 180, 185),
                        fontFamily: 'Poppins',
                        fontSize: 17,
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                        onTap: (() => {moveToHome(context)}),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 80, 195, 202)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 115, right: 115, bottom: 15, top: 15),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have Account ? ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontFamily: 'Poppins Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                    InkWell(
                      onTap: (() => {
                            Navigator.pushNamed(context, MyRoutes.registerRoute)
                          }),
                      child: const Text("Sign Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 80, 195, 202),
                              fontFamily: 'Poppins Regular',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    )
                  ],
                ),
              ],
            ),
          ))),
    );
  }
}
