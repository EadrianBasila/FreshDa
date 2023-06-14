import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:freshda/scanner/widgetScanResult.dart';
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
  bool isFlash = false;

  int milkfishScan = 0;
  int mackerelScan = 0;
  int tilapiaScan = 0;
  int redsnapperScan = 0;

  bool isRecognized = false;
  String fishOutput = 'Scanning';
  String confidence = "00.00";
  double confidenceValue = 0.0;
  double confidencePercent = 0.0;
  String fishPicture = "Scanning";

  List<String> fishLabels = ['0 Tilapia', '1 Bangus', '2 Galunggong'];

  List<String> fishNames = ['Tilapia', 'MilkFish', 'Mackerel Scad'];
  List<String> fishPictures = ['TilapiaFull', 'MilkFishFull', 'MackerelFull'];

  @override
  void initState() {
    startCamera();
    getFields();
    loadModel();
    super.initState();
  }

  // Future loadModel() async {
  //   await Tflite.close();
  //   try {
  //     await Tflite.loadModel(
  //       model: 'assets/fish.tflite',
  //       labels: 'assets/fishlabels.txt',
  //       numThreads: 1,
  //       isAsset: true,
  //       useGpuDelegate: false,
  //     );
  //     print("Model Loaded");
  //   } catch (e) {
  //     print("Error Loading Model");
  //     print(e);
  //   }
  // }

  Future loadModel() async {
    print("Loading Model");
    await Tflite.loadModel(
      model: 'assets/fish.tflite',
      labels: 'assets/fishLabels.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print("Model Loaded");
  }

  runModel() async {
    print("Running Model");
    print("Running Model");
    print("Running Model");
    print("Running Model");
    print("Running Model");
    if (cameraImage != null) {
      print("Camera Image is not null");
      print("Camera Image is not null");
      print("Camera Image is not null");
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
          print("Model Response: ");
          print(modelResponse);
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
            confidenceValue = double.parse(confidence);
            //string to double
            confidencePercent = confidenceValue / 100;
            int index = fishLabels.indexOf(modelResponse);
            String parsedFish = fishNames[index];
            if (parsedFish == 'Tilapia') {
              tilapiaScan++;
            } else if (parsedFish == 'MilkFish') {
              milkfishScan++;
            } else if (parsedFish == 'Mackerel Scad') {
              mackerelScan++;
            }
            addFields();
            print("Detected Fish $parsedFish");

            fishPictures[index];
            print("Recognized Fish: $parsedFish Confidence: $confidence");
            fishOutput = parsedFish;
            isRecognized = true;
          }
        });
      });
    } else {
      print("Camera Image is null");
      print("Camera Image is null");
      print("Camera Image is null");
    }
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
        cameras[cameraIndex], ResolutionPreset.medium,
        enableAudio: false);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        print("Camera Started");
        cameraController.startImageStream((imageFromStream) {
          print("Camera Streaming");
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
                      if (isFlash == false) {
                        isFlash = true;
                        cameraController.setFlashMode(FlashMode.torch);
                      } else {
                        isFlash = false;
                        cameraController.setFlashMode(FlashMode.off);
                      }
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
                          Icon(
                            isFlash
                                ? Icons.flash_on_rounded
                                : Icons.flash_off_rounded,
                            color: graySubtextLight,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Flash',
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
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: CameraPreview(cameraController)))),
              WidgetScanResult(
                fish: fishOutput,
                fishPic: fishOutput,
                freshnessLevel: 'FRESH',
                scanAccuracy: '$confidence%',
                scanAccuracyPercent: confidencePercent,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
