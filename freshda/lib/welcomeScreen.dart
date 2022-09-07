import 'package:flutter/material.dart';
import 'package:freshda/authentication/loginScreen.dart';
import 'package:freshda/constant.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(25),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/BGFish.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('FRESHDA.', 
                      style: TextStyle(
                        color: customPurple, 
                        fontSize: 40,
                        fontFamily: 'LawyerGothic'),
                      ),
                    Text('Fish freshness detection  \nand classification', 
                      style: TextStyle(
                        color: graySubtextDark, 
                        fontSize: 23),
                      )
                  ],
                ), //LAwyer gothic font
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 6,
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ))
                      ),
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Proceed',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'LawyerGothic',
                            color: grayMaintext,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],

          ),
        ),
    );
  }
}