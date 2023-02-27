import 'package:flutter/material.dart';
import 'package:freshda/authentication/registerScreen.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/BGFish.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text('FRESHDA.', 
                          style: TextStyle(
                            color: customPurple, 
                            fontSize: 40,
                            fontFamily: 'LawyerGothic'),
                          ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'LawyerGothic',
                            color: grayMaintext,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          padding: const EdgeInsets.only(left: 25, right: 25, top:7, bottom:7),
                          margin: const EdgeInsets.only( top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: grayContainer,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 9,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            style: const TextStyle(
                              fontSize: 30,
                              color: customBlue,
                            ),
                            decoration: const InputDecoration(
                              //labelText: 'Username',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                //firstName = value;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return "required";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                            
                            fontSize: 18,
                            fontFamily: 'LawyerGothic',
                            color: grayMaintext,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          padding: const EdgeInsets.only(left: 25, right: 25, top:6, bottom:7),
                          margin: const EdgeInsets.only( top: 5),
                          decoration: BoxDecoration(
                            color: grayContainer,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 9,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            obscureText: true,
                            style: const TextStyle(
                              fontSize: 30,
                              color: customBlue,
                            ),
                            decoration: const InputDecoration(
                              //labelText: 'Password',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                //firstName = value;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return "required";
                              }
                          return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'FORGOT YOUR PASSWORD?',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'LawyerGothic',
                                color: grayMaintext,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                //Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text(
                                'KAPE KA MUNA',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'LawyerGothic',
                                  color: customRed,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 50,
                        ),
                        
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan.withOpacity(0.2),
                              spreadRadius: 6,
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(customBlue,),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0),
                              ))
                              ),
                          onPressed: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'LawyerGothic',
                                    color: grayMaintext,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'DOESN\'T HAVE AN ACCOUNT YET?',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'LawyerGothic',
                                color: grayMaintext,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'LawyerGothic',
                                  color: customBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            )
          )
        )
      ),
    );
  }
}