import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WidgetScanResult extends StatelessWidget {
  final String fish;
  final String fishPic;
  final String freshnessLevel;
  final String scanAccuracy;
  final double scanAccuracyPercent;
  const WidgetScanResult({
    Key? key,
    required this.fish,
    required this.fishPic,
    required this.freshnessLevel,
    required this.scanAccuracy,
    required this.scanAccuracyPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      child: Image.asset('assets/$fishPic.png',
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
                            Text(
                              fish,
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
                            Text(
                              'Freshness level - $freshnessLevel',
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
                        percent: scanAccuracyPercent,
                        center: Text('$scanAccuracy%',
                            style: const TextStyle(
                                color: graySubtextDark, fontSize: 12)),
                        barRadius: const Radius.circular(16),
                        progressColor: customBlue,
                        backgroundColor: grayButton.withOpacity(0.5),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
