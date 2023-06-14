import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WidgetScan extends StatelessWidget {
  final String fishPic;
  final String fish;
  final String scanAccuracy;
  final double scanAccuracyPercent;
  final int totalScans;
  final Color percentColor;
  const WidgetScan({
    Key? key,
    required this.fishPic,
    required this.fish,
    required this.scanAccuracy,
    required this.scanAccuracyPercent,
    required this.totalScans,
    required this.percentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.35 / 3,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: grayPictureContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    child: Image.asset('assets/$fishPic.png',
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fish,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: customRed,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      'Scan Accuracy',
                      style: TextStyle(
                        color: graySubtextDark,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Scans:  $totalScans',
                      style: const TextStyle(
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
              percent: scanAccuracyPercent,
              center: Text(scanAccuracy,
                  style: TextStyle(color: percentColor, fontSize: 12)),
              barRadius: const Radius.circular(16),
              progressColor: customBlue,
              backgroundColor: grayMaintext,
            ),
          ],
        ),
      ),
    );
  }
}
