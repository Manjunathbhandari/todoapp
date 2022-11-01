import 'package:flutter/material.dart';
import 'package:todoapp/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 240, 240, 240),
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/Shape.png', height: 130),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/undraw_develop_app_re_bi4i 1.png',
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 15),
                  child: Text(
                    "Things To Do With TODO",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Ullamcorper leo in eros parturient arcu odio diam. Gravida faucibus ac mauris et ritus",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                      color: Color.fromARGB(255, 112, 112, 112),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (() =>
                        {Navigator.pushNamed(context, MyRoutes.registerRoute)}),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 80, 195, 202)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 115, right: 115, bottom: 15, top: 15),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
