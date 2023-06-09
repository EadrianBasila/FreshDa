import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/database/mlikfishScreen.dart';

class WidgetDatabase extends StatelessWidget {
  final Widget widgetFish;
  final String fish;
  final String fishPic;
  final String scanAccuracy;
  final int totalScan;
  const WidgetDatabase({
    Key? key,
    required this.widgetFish,
    required this.fish,
    required this.fishPic,
    required this.scanAccuracy,
    required this.totalScan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widgetFish,
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
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
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height * 0.15 - 20,
                decoration: const BoxDecoration(
                  color: graySubtextLight,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  child:
                      Image.asset('assets/$fishPic.png', fit: BoxFit.fitWidth),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fish,
                      style: TextStyle(
                          color: customRed,
                          fontSize: 24,
                          fontFamily: 'LawyerGothic'),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  scanAccuracy,
                                  style: TextStyle(
                                      color: graySubtextLight,
                                      fontSize: 20,
                                      fontFamily: 'LawyerGothic'),
                                ),
                                Text(
                                  'Accuracy',
                                  style: TextStyle(
                                    color: graySubtextDark,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  totalScan.toString(),
                                  style: TextStyle(
                                      color: graySubtextLight,
                                      fontSize: 20,
                                      fontFamily: 'LawyerGothic'),
                                ),
                                Text(
                                  'Scans',
                                  style: TextStyle(
                                    color: graySubtextDark,
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
    );
  }
}
