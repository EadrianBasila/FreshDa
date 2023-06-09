import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/widgetAlert.dart';
import 'package:freshda/dashboard/widgetScan.dart';
import 'package:freshda/database/databaseScreen.dart';
import 'package:freshda/globalVar.dart';
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

  final Stream<DocumentSnapshot> userStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

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
                          StreamBuilder<DocumentSnapshot>(
                              stream: userStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text("Loading");
                                }

                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      WidgetScan(
                                        fishPic: 'MilkFishHalf',
                                        fish: 'Milk Fish',
                                        scanAccuracy: data['milkfishScan'] == 0
                                            ? '0%'
                                            : '78%',
                                        scanAccuracyPercent:
                                            data['milkfishScan'] == 0
                                                ? 0
                                                : 0.78,
                                        totalScans: data['milkfishScan'],
                                        percentColor: data['milkfishScan'] == 0
                                            ? graySubtextLight
                                            : graySubtextDark,
                                      ),
                                      WidgetScan(
                                        fishPic: 'MackerelHalf',
                                        fish: 'Mackerel',
                                        scanAccuracy: data['mackerelScan'] == 0
                                            ? '0%'
                                            : '98.0%',
                                        scanAccuracyPercent:
                                            data['mackerelScan'] == 0
                                                ? 0
                                                : 0.98,
                                        totalScans: data['mackerelScan'],
                                        percentColor: data['mackerelScan'] == 0
                                            ? graySubtextLight
                                            : graySubtextDark,
                                      ),
                                      WidgetScan(
                                        fishPic: 'TilapiaHalf',
                                        fish: 'Tilapia',
                                        scanAccuracy: data['tilapiaScan'] == 0
                                            ? '0%'
                                            : '85.0%',
                                        scanAccuracyPercent:
                                            data['tilapiaScan'] == 0 ? 0 : 0.85,
                                        totalScans: data['tilapiaScan'],
                                        percentColor: data['tilapiaScan'] == 0
                                            ? graySubtextLight
                                            : graySubtextDark,
                                      ),
                                      WidgetScan(
                                        fishPic: 'RedSnapperHalf',
                                        fish: 'Red Snapper',
                                        scanAccuracy:
                                            data['redsnapperScan'] == 0
                                                ? '0%'
                                                : '67.0%',
                                        scanAccuracyPercent:
                                            data['redsnapperScan'] == 0
                                                ? 0
                                                : 0.67,
                                        totalScans: data['redsnapperScan'],
                                        percentColor:
                                            data['redsnapperScan'] == 0
                                                ? graySubtextLight
                                                : graySubtextDark,
                                      ),
                                    ],
                                  ),
                                );
                              }),
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
                          child: Column(
                            children: const [
                              WidgetAlert(
                                time: '7min Ago',
                                alert: 'Help us train FRESHDA!',
                                alertPic: 'Alert',
                              ),
                              WidgetAlert(
                                time: '7min Ago',
                                alert: 'Help us train FRESHDA!',
                                alertPic: 'Alert',
                              ),
                              WidgetAlert(
                                time: '7min Ago',
                                alert: 'Help us train FRESHDA!',
                                alertPic: 'Alert',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
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
