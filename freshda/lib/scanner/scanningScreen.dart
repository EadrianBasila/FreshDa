import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:freshda/scanner/widgetScanResult.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScanningSCreen extends StatefulWidget {
  const ScanningSCreen({Key? key}) : super(key: key);

  @override
  State<ScanningSCreen> createState() => _ScanningSCreenState();
}

class _ScanningSCreenState extends State<ScanningSCreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int milkfishScan = 0;
  int mackerelScan = 0;
  int tilapiaScan = 0;
  int redsnapperScan = 0;

  bool isScanned = false;

  @override
  void initState() {
    startCamera();
    getFields();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  void getFields() async {
    //get the fields in the user collection
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          milkfishScan = documentSnapshot['milkfishScan'];
          mackerelScan = documentSnapshot['mackerelScan'];
          tilapiaScan = documentSnapshot['tilapiaScan'];
          redsnapperScan = documentSnapshot['redsnapperScan'];
        });
      }
    });
  }

  //add fields to user collection in firebase
  void addFields() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'milkfishScan': milkfishScan,
      'mackerelScan': mackerelScan,
      'tilapiaScan': tilapiaScan,
      'redsnapperScan': redsnapperScan,
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    isScanned = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return SizedBox();
    }
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
                      // setState(() {
                      //   isScanned = false;
                      // });
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
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(30),
                  //   child: Image.asset(
                  //     'assets/MilkFishFull.png',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: CameraPreview(cameraController)))),
              isScanned
                  ? const WidgetScanResult(
                      fish: 'MILK FISH',
                      fishPic: 'MilkFishFull',
                      freshnessLevel: 'FRESH',
                      scanAccuracy: '80%',
                      scanAccuracyPercent: 0.8,
                    )
                  : Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 80,
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
                              setState(() {
                                isScanned = true;
                                //if scanned is milkfish then add 1
                                if (isScanned == true) {
                                  milkfishScan++;
                                  addFields();
                                }
                              });
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
                              padding: EdgeInsets.only(top: 10.0, bottom: 10),
                              child: Text(
                                'START SCAN',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'LawyerGothic',
                                  color: grayMaintext,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              Container()
            ]),
          ),
        ),
      ),
    );
  }
}
