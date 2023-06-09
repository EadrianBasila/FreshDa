import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';

class WidgetAlert extends StatelessWidget {
  final String time;
  final String alert;
  final String alertPic;
  const WidgetAlert({
    Key? key,
    required this.time,
    required this.alert,
    required this.alertPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 3),
            child: Text(time,
                style: const TextStyle(
                    color: graySubtextDark,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            //margin: EdgeInsets.only(left: 20, right: 20),
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: grayButton,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: grayButton.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    child: Image.asset('assets/$alertPic.png',
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(alert,
                        style: const TextStyle(
                          color: graySubtextLight,
                          fontSize: 20,
                        )),
                    GestureDetector(
                      onTap: () {
                        //link redirect
                      },
                      child: const Text('Learn More >',
                          style: TextStyle(
                            color: customYellow,
                            fontSize: 15,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
