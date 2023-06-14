import 'package:flutter/material.dart';
import 'package:freshda/authentication/registerScreen.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/dashboard/homeScreen.dart';
import 'package:freshda/resources/authMethods.dart';
import 'package:freshda/resources/snackBar.dart';
import 'package:freshda/widgets/textField.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  bool _isObscure = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_emailController.text == "" || _passwordController.text == "") {
      showSnackBar(context, "Please fill all the fields");
      _isLoading = false;
      return;
    } else {
      String res = await AuthMethods().loginUser(
          email: _emailController.text,
          password: _passwordController.text,
          context: context);
      if (res == 'success') {
        Navigator.of(context).pushAndRemoveUntil(
            PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 200),
              child: const HomeScreen(),
            ),
            (route) => false);

        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(context, res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Container(
                padding: const EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height - 25,
                // width: MediaQuery.of(context).size.width,
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
                          Text(
                            'FRESHDA.',
                            style: TextStyle(
                                color: customPurple,
                                fontSize: 40,
                                fontFamily: 'LawyerGothic'),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'LawyerGothic',
                              color: grayMaintext,
                            ),
                          ),
                          TextFieldInput(
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _emailController,
                            textCapitalization: TextCapitalization.none,
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
                          TextFieldInput(
                            textInputType: TextInputType.text,
                            textEditingController: _passwordController,
                            textCapitalization: TextCapitalization.none,
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
                            height: 120,
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
                                backgroundColor: MaterialStateProperty.all(
                                  customBlue,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ))),
                            onPressed: () {
                              loginUser();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const HomeScreen(),
                              //     ));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
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
              )))),
    );
  }
}
