import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/database/databaseScreen.dart';

class MilkFish extends StatefulWidget {
  const MilkFish({Key? key}) : super(key: key);

  @override
  State<MilkFish> createState() => _MilkFishState();
}

class _MilkFishState extends State<MilkFish> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Stack(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        child: const Text(
                          'MILK FISH',
                          style: TextStyle(
                              color: customRed,
                              fontSize: 30,
                              fontFamily: 'LawyerGothic'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: grayButton,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height *
                                  0.70 /
                                  2.5,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                child: Image.asset('assets/MilkFishFull.png',
                                    fit: BoxFit.fitWidth),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              padding: EdgeInsets.all(20),
                              height:
                                  MediaQuery.of(context).size.height * 0.70 / 3,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: grayButton,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: graySubtextLight.withOpacity(0.4),
                                    spreadRadius: 15,
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'ABOUT',
                                      style: TextStyle(
                                          color: customYellow,
                                          fontSize: 25,
                                          fontFamily: 'LawyerGothic'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        'A milkfish is a species of fish that lives in tropical and subtropical waters of the Indian and Pacific Oceans. It is an important source of food for many people, especially in Southeast Asia. It has a silver color, a streamlined body, and a forked tail.',
                                        style: TextStyle(
                                          color: graySubtextLight,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              padding: EdgeInsets.all(20),
                              height:
                                  MediaQuery.of(context).size.height * 0.70 / 4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: grayButton,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: graySubtextLight.withOpacity(0.4),
                                    spreadRadius: 15,
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  'Milkfish tastes similar to catfish when cooked. The meat is white flaky flesh with a mildly chewy texture that flakes easily. It is typically deep-fried or baked with herbs and spices, but can also be cooked in soup, sauteed, poached, grilled, broiled, or steamed.',
                                  style: TextStyle(
                                    color: graySubtextLight,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          color: customBlue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        height: 40,
                        width: 80,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DatabaseScreen(),
                                  ));
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: grayMaintext,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
