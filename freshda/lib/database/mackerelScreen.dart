import 'package:flutter/material.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/database/databaseScreen.dart';

class Mackerel extends StatefulWidget {
  const Mackerel({ Key? key }) : super(key: key);

  @override
  State<Mackerel> createState() => _MackerelState();
}

class _MackerelState extends State<Mackerel> {
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
                          'MACKEREL SCAD',
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
                                child: Image.asset('assets/MackerelFull.png',
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
                                    'The mackerel scad, known as Decapterus macarellus, is a slender, silver fish found in warm tropical and subtropical waters worldwide. It has a streamlined body, silvery coloration, and dark vertical stripes along its sides. Growing up to 18 inches in length, it possesses a pointed snout, a large mouth with sharp teeth, and a deeply forked tail. The mackerel scad is highly regarded for its rich, savory flavor, with a firm yet tender texture. Its taste is often compared to mackerel or sardines but milder. This versatile fish can be grilled, baked, fried, steamed, pickled, or smoked, offering a range of culinary options. It is prized by anglers and commonly enjoyed in coastal cuisines worldwide.',
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
                              child: Text(
                               'The mackerel scad, a slender silver fish with dark vertical stripes, is found in warm tropical and subtropical waters globally. It grows up to 18 inches long and has a streamlined body, pointed snout, large mouth, and deeply forked tail. Known for its rich, savory flavor, it has firm, tender flesh with a mild, buttery taste similar to mackerel or sardines. This versatile fish can be prepared by grilling, baking, frying, steaming, pickling, or smoking, and is cherished by anglers and coastal cuisine enthusiasts.',
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