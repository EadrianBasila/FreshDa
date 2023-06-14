import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:freshda/scanner/widgetScanResult.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tflite/tflite.dart';

class ScanningSCreen extends StatefulWidget {
  const ScanningSCreen({Key? key}) : super(key: key);

  @override
  State<ScanningSCreen> createState() => _ScanningSCreenState();
}

class _ScanningSCreenState extends State<ScanningSCreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  CameraImage? cameraImage;
  bool isFrontCam = false;
  int cameraIndex = 0;

  int milkfishScan = 0;
  int mackerelScan = 0;
  int tilapiaScan = 0;
  int redsnapperScan = 0;

  bool isScanned = false;
  bool isRecognized = false;
  String fishOutput = 'Scanning for Fish';
  String confidence = "";
  double confidenceValue = 0.0;
  String fishPicture = "";

  List<String> fishLabels = ['0 Bangus', '1 Tilapia', '2 Galunggong'];

  List<String> fishNames = ['Milkfish', 'Tilapia', 'Mackerel Scad'];
  List<String> fishPictures = ['MilkFishFull', 'TilapiaFull', 'MackerelFull'];
  @override
  void initState() {
    startCamera();
    getFields();
    loadModel();
    super.initState();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/fish.tflite',
      labels: 'assets/fishlabels.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  runModel() async {
    if (cameraImage != null) {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      print(recognitions);
      recognitions!.forEach((response) {
        setState(() {
          //output = response['label'];
          //textvoice = response['label'];

          String modelResponse = response['label'];
          if (fishLabels.contains(modelResponse)) {
            double confidenceValue = response['confidence'];
            double confidenceDecimal =
                confidenceValue - confidenceValue.toInt();
            List<String> confidenceArray =
                confidenceDecimal.toStringAsFixed(4).split("");
            String confidenceOutput =
                "${confidenceArray[2]}${confidenceArray[3]}.${confidenceArray[4]}${confidenceArray[5]}";
            //confidence = double.parse(confidenceOutput);
            confidence = confidenceOutput;
            confidenceValue = double.parse(confidenceOutput);
            int index = fishLabels.indexOf(modelResponse);
            String parsedFish = fishNames[index];
            fishPicture = fishPictures[index];
            print("Recognized Fish: $parsedFish Confidence: $confidence");
            fishOutput = parsedFish;
            isRecognized = true;
          }
        });
      });
    }
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
        cameras[cameraIndex], ResolutionPreset.low,
        enableAudio: false);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imageFromStream) {
          cameraImage = imageFromStream;
          runModel();
        });
      });
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
                  ? WidgetScanResult(
                      fish: fishOutput,
                      fishPic: fishPicture,
                      freshnessLevel: 'FRESH',
                      scanAccuracy: '$confidence%',
                      scanAccuracyPercent: confidenceValue,
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
                                  //milkfishScan++;
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
