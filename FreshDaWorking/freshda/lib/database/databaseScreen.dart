import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:freshda/database/mackerelScreen.dart';
import 'package:freshda/database/mlikfishScreen.dart';
import 'package:freshda/database/redsnapperScreen.dart';
import 'package:freshda/database/tilapiaScreen.dart';
import 'package:freshda/database/widgetDatabase.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Stream<DocumentSnapshot> userStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/BG.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'DATABASE',
                        style: TextStyle(
                            color: customRed,
                            fontSize: 35,
                            fontFamily: 'LawyerGothic'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        child: const Text(
                          ' < HOME',
                          style: TextStyle(
                              color: graySubtextDark,
                              fontSize: 13,
                              fontFamily: 'LawyerGothic'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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

                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;

                        return Container(
                          height: MediaQuery.of(context).size.height - 250,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                WidgetDatabase(
                                  widgetFish: MilkFish(),
                                  fish: 'Milk Fish',
                                  fishPic: 'MilkFishHalf',
                                  scanAccuracy:
                                      data['milkfishScan'] == 0 ? '0%' : '78%',
                                  totalScan: data['milkfishScan'],
                                ),
                                WidgetDatabase(
                                  widgetFish: Mackerel(),
                                  fish: 'Mackerel S.',
                                  fishPic: 'MackerelHalf',
                                  scanAccuracy:
                                      data['mackarelScan'] == 0 ? '0%' : '98%',
                                  totalScan: data['mackarelScan'],
                                ),
                                WidgetDatabase(
                                  widgetFish: Tilapia(),
                                  fish: 'Tilapia',
                                  fishPic: 'TilapiaHalf',
                                  scanAccuracy:
                                      data['tilapiaScan'] == 0 ? '0%' : '85.0%',
                                  totalScan: data['tilapiaScan'],
                                ),
                                WidgetDatabase(
                                  widgetFish: RedSnapper(),
                                  fish: 'Red Snapper',
                                  fishPic: 'RedSnapperHalf',
                                  scanAccuracy: data['redsnapperScan'] == 0
                                      ? '0%'
                                      : '67.0%',
                                  totalScan: data['redsnapperScan'],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const Text(
                    'MORE FISH COMING IN THE FUTURE',
                    style: TextStyle(
                        color: graySubtextDark,
                        fontSize: 10,
                        fontFamily: 'LawyerGothic'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
