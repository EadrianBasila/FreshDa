import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/database/databaseScreen.dart';

class Tilapia extends StatefulWidget {
  const Tilapia({ Key? key }) : super(key: key);

  @override
  State<Tilapia> createState() => _TilapiaState();
}

class _TilapiaState extends State<Tilapia> {
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
                          'TILAPIA',
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
                                child: Image.asset('assets/TilapiaFull.png',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:20, right:20, bottom:20),
                              padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height *
                                  0.70 /
                                  2.7,
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
                                   Text(
                                    'Tilapia is a freshwater fish known for its mild flavor and adaptability in cooking. With its elongated body, scaleless skin, and firm white flesh, it can vary in color and is enjoyed worldwide. Its versatility shines through in the kitchen, as it can be baked, grilled, fried, or steamed, allowing for a range of culinary creations. The mild taste of tilapia makes it a popular choice for various seasonings and flavors, perfect for incorporating into different cuisines and recipes.',
                                    style: TextStyle(
                                      color: graySubtextLight,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:20, right:20, bottom:10),
                              padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height *
                                  0.70 /
                                  5,
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
                              child: const Text(
                               "Tilapia, a freshwater fish with a mild flavor, is prized for its adaptability in cooking. It has an elongated body, scaleless skin, and firm white flesh that varies in color. Whether baked, grilled, fried, or steamed, tilapia's versatility shines through, making it a go-to option for various seasonings and flavors in different cuisines.",
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
                                  builder: (context) => const DatabaseScreen(),
                                ));
                              },
                            child: const Text(
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