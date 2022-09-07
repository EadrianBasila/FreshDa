import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScanningSCreen extends StatefulWidget {
  const ScanningSCreen({Key? key}) : super(key: key);

  @override
  State<ScanningSCreen> createState() => _ScanningSCreenState();
}

class _ScanningSCreenState extends State<ScanningSCreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(
                          top: 10, left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        color: grayContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: graySubtextLight,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(
                          top: 10, left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        color: grayContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.save,
                            color: graySubtextLight,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Save',
                            style: TextStyle(
                              color: graySubtextLight,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: grayContainer,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/MilkFishFull.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: grayButton.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: grayButton.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 5),
                        height: 8,
                        width: 120,
                        decoration: BoxDecoration(
                          color: graySubtextLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                bottomLeft: const Radius.circular(10.0),
                              ),
                              child: Image.asset('assets/MilkFishFull.png',
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'MILK FISH',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: customRed,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const Text(
                                      'Scan Confidence',
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Freshness level - FRESH',
                                      style: TextStyle(
                                        color: Colors.cyan,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width / 2.2,
                                animation: true,
                                lineHeight: 12.0,
                                animationDuration: 1500,
                                percent: 0.8,
                                barRadius: const Radius.circular(16),
                                progressColor: customBlue,
                                backgroundColor: grayButton.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container()
            ]),
          ),
        ),
      ),
    );
  }
}
