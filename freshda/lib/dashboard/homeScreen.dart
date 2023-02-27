import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/database/databaseScreen.dart';
import 'package:freshda/scanner/scanningScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser;

  String? firstName;
  String? lastName;

  getUserData() async {
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      firstName = userData['firstName'];
      lastName = userData['lastName'];
    });
    print("First Name: $firstName");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BGFish.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: grayDashboard, //graySubtextLight.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40.0)),
                    boxShadow: [
                      BoxShadow(
                        color: graySubtextLight.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "$firstName $lastName",
                                    style: const TextStyle(
                                      color: Colors.black26,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Text(
                                    'Personal Profile',
                                    style: TextStyle(
                                      color: graySubtextLight,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: grayPictureContainer,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: graySubtextDark,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'DASHBOARD',
                            style: TextStyle(
                                color: customRed,
                                fontSize: 25,
                                fontFamily: 'LawyerGothic'),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: MediaQuery.of(context).size.height *
                                        0.35 /
                                        3,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: grayButton,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grayButton.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: grayPictureContainer,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/MilkFishHalf.png',
                                                    fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Milk Fish',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: customRed,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  'Scan Accuracy',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Total Scans',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 15.0,
                                          animationDuration: 1500,
                                          percent: 0.78,
                                          center: const Text("78.0%",
                                              style: TextStyle(
                                                  color: graySubtextDark,
                                                  fontSize: 12)),
                                          barRadius: const Radius.circular(16),
                                          progressColor: customBlue,
                                          backgroundColor: grayMaintext,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: MediaQuery.of(context).size.height *
                                        0.35 /
                                        3,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: grayButton,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grayButton.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: grayPictureContainer,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/MackerelHalf.png',
                                                    fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Mackerel',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: customRed,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  'Scan Accuracy',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Total Scans',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 15.0,
                                          animationDuration: 1500,
                                          percent: 0.98,
                                          center: const Text("98.0%",
                                              style: TextStyle(
                                                  color: graySubtextDark,
                                                  fontSize: 12)),
                                          barRadius: const Radius.circular(16),
                                          progressColor: customYellow,
                                          backgroundColor: grayMaintext,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: MediaQuery.of(context).size.height *
                                        0.35 /
                                        3,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: grayButton,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grayButton.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: grayPictureContainer,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/TilapiaHalf.png',
                                                    fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Tilapia',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: customRed,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  'Scan Accuracy',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Total Scans',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 15.0,
                                          animationDuration: 1500,
                                          percent: 0.85,
                                          center: const Text("85.0%",
                                              style: TextStyle(
                                                  color: graySubtextDark,
                                                  fontSize: 12)),
                                          barRadius: const Radius.circular(16),
                                          progressColor: customRed,
                                          backgroundColor: grayMaintext,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: MediaQuery.of(context).size.height *
                                        0.35 /
                                        3,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: grayButton,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grayButton.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(10),
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: grayPictureContainer,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/RedSnapperHalf.png',
                                                    fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Red Snapper',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: customRed,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  'Scan Accuracy',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Total Scans',
                                                  style: TextStyle(
                                                    color: graySubtextDark,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 15.0,
                                          animationDuration: 1500,
                                          percent: 0.67,
                                          center: const Text("67.0%",
                                              style: TextStyle(
                                                  color: graySubtextDark,
                                                  fontSize: 12)),
                                          barRadius: const Radius.circular(16),
                                          progressColor: customPurple,
                                          backgroundColor: grayMaintext,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 8,
                        width: 120,
                        decoration: BoxDecoration(
                          color: grayButton,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20, top: 30, bottom: 10),
                        child: Text(
                          'ALERTS',
                          style: TextStyle(
                              color: graySubtextDark,
                              fontSize: 25,
                              fontFamily: 'LawyerGothic'),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 3),
                                        child: Text('7min Ago',
                                            style: TextStyle(
                                                color: graySubtextDark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(left: 20, right: 20),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: grayButton,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  grayButton.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/Alert.png',
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text('Help us train FRESHDA!',
                                                    style: TextStyle(
                                                      color: graySubtextLight,
                                                      fontSize: 20,
                                                    )),
                                                Text('Learn More >',
                                                    style: TextStyle(
                                                      color: customYellow,
                                                      fontSize: 15,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 3),
                                        child: Text('7min Ago',
                                            style: TextStyle(
                                                color: graySubtextDark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(left: 20, right: 20),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: grayButton,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  grayButton.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/Alert.png',
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text('Help us train FRESHDA!',
                                                    style: TextStyle(
                                                      color: graySubtextLight,
                                                      fontSize: 20,
                                                    )),
                                                Text('Learn More >',
                                                    style: TextStyle(
                                                      color: customYellow,
                                                      fontSize: 15,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 3),
                                        child: Text('7min Ago',
                                            style: TextStyle(
                                                color: graySubtextDark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(left: 20, right: 20),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: grayButton,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  grayButton.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                ),
                                                child: Image.asset(
                                                    'assets/Alert.png',
                                                    fit: BoxFit.fitHeight),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text('Help us train FRESHDA!',
                                                    style: TextStyle(
                                                      color: graySubtextLight,
                                                      fontSize: 20,
                                                    )),
                                                Text('Learn More >',
                                                    style: TextStyle(
                                                      color: customYellow,
                                                      fontSize: 15,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        margin: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DatabaseScreen()),
                                  );
                                },
                                child: const Text(
                                  'DATABASE',
                                  style: TextStyle(
                                      color: graySubtextDark,
                                      fontSize: 13,
                                      fontFamily: 'LawyerGothic'),
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(5),
                            //   height: 80,
                            //   width: MediaQuery.of(context).size.width * 0.39,
                            //   decoration: BoxDecoration(
                            //     color: Colors.transparent,
                            //     borderRadius: BorderRadius.circular(35),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: customRed.withOpacity(0.3),
                            //         spreadRadius: 2,
                            //         blurRadius: 18,
                            //       ),
                            //     ],
                            //   ),
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 const ScanningSCreen()),
                            //       );
                            //     },
                            //     child: const Padding(
                            //       padding:
                            //           EdgeInsets.only(top: 10.0, bottom: 10),
                            //       child: const Text(
                            //         'SCAN',
                            //         style: TextStyle(
                            //           fontSize: 30,
                            //           fontFamily: 'LawyerGothic',
                            //           color: grayMaintext,
                            //         ),
                            //       ),
                            //     ),
                            //     style: ButtonStyle(
                            //         backgroundColor: MaterialStateProperty.all(
                            //           customRed,
                            //         ),
                            //         shape: MaterialStateProperty.all<
                            //                 RoundedRectangleBorder>(
                            //             RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(35.0),
                            //         ))),
                            //   ),
                            // ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.39,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: [
                                  BoxShadow(
                                    color: customRed.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 18,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScanningSCreen()),
                                  );
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      customRed,
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                    ))),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Text(
                                    'SCAN',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'LawyerGothic',
                                      color: grayMaintext,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'SETTINGS',
                                  style: TextStyle(
                                      color: graySubtextDark,
                                      fontSize: 13,
                                      fontFamily: 'LawyerGothic'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
