import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 240, 240, 240),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/Shape.png', height: 130),
              ),
              const SizedBox(height: 15),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 20, 10),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet());
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 10),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(-5, 0),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(5, 0),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Send Via Email?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Poppins Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Send Verification Code via Registerd Email Address",
                                style: TextStyle(
                                    fontFamily: 'Poppins Regular',
                                    fontSize: 14))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet());
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 10),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(-5, 0),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 10,
                                offset: Offset(5, 0),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Send Via Phone?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Poppins Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Send Verification Code via Registerd Phone Number",
                                style: TextStyle(
                                    fontFamily: 'Poppins Regular',
                                    fontSize: 14))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ])
            ]),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Verification Code has been sent",
                  style: TextStyle(
                      fontFamily: 'Poppins Regular', color: Colors.yellow)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
