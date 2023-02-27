import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:freshda/database/mackerelScreen.dart';
import 'package:freshda/database/mlikfishScreen.dart';
import 'package:freshda/database/redsnapperScreen.dart';
import 'package:freshda/database/tilapiaScreen.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MilkFish(),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: grayButton,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grayButton.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                    0.15 -
                                                20,
                                        decoration: const BoxDecoration(
                                          color: graySubtextLight,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomLeft: Radius.circular(30.0),
                                          ),
                                          child: Image.asset(
                                              'assets/MilkFishHalf.png',
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Milk Fish',
                                              style: TextStyle(
                                                  color: customRed,
                                                  fontSize: 24,
                                                  fontFamily: 'LawyerGothic'),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '78%',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Accuracy',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '175',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Scans',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Mackerel(),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: grayButton,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grayButton.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                    0.15 -
                                                20,
                                        decoration: const BoxDecoration(
                                          color: graySubtextLight,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomLeft: Radius.circular(30.0),
                                          ),
                                          child: Image.asset(
                                              'assets/MackerelHalf.png',
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Mackerel S.',
                                              style: TextStyle(
                                                  color: customRed,
                                                  fontSize: 24,
                                                  fontFamily: 'LawyerGothic'),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '98%',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Accuracy',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '255',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Scans',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Tilapia(),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: grayButton,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grayButton.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                    0.15 -
                                                20,
                                        decoration: const BoxDecoration(
                                          color: graySubtextLight,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomLeft: Radius.circular(30.0),
                                          ),
                                          child: Image.asset(
                                              'assets/TilapiaHalf.png',
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Tilapia',
                                              style: TextStyle(
                                                  color: customRed,
                                                  fontSize: 24,
                                                  fontFamily: 'LawyerGothic'),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '85%',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Accuracy',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '395',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Scans',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RedSnapper(),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: grayButton,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grayButton.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                    0.15 -
                                                20,
                                        decoration: const BoxDecoration(
                                          color: graySubtextLight,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomLeft: Radius.circular(30.0),
                                          ),
                                          child: Image.asset(
                                              'assets/RedSnapperHalf.png',
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Red Snapper',
                                              style: TextStyle(
                                                  color: customRed,
                                                  fontSize: 24,
                                                  fontFamily: 'LawyerGothic'),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '67%',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Accuracy',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          '155',
                                                          style: TextStyle(
                                                              color:
                                                                  graySubtextLight,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'LawyerGothic'),
                                                        ),
                                                        Text(
                                                          'Scans',
                                                          style: TextStyle(
                                                            color:
                                                                graySubtextDark,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
