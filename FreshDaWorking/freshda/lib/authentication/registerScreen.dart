import 'package:flutter/material.dart';
import 'package:freshda/authentication/loginScreen.dart';
import 'package:freshda/constant.dart';
import 'package:freshda/resources/authMethods.dart';
import 'package:freshda/resources/snackBar.dart';
import 'package:freshda/widgets/textField.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confpassController = TextEditingController();

  bool _isObscure = false;
  bool _isObscure1 = false;

  bool _isLoading = false;

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    if (_usernameController.text == "" ||
        _emailController.text == "" ||
        _firstnameController.text == "" ||
        _lastnameController.text == "" ||
        _passwordController.text == "") {
      showSnackBar(context, "Please fill all the fields");
      _isLoading = false;
      return;
    } else {
      if (_passwordController.text != _confpassController.text) {
        showSnackBar(context, "Password doesn't match");
        _isLoading = false;
        return;
      } else if (_confpassController.text == "") {
        showSnackBar(context, "Please confirm your password");
        _isLoading = false;
        return;
      } else {
        String res = await AuthMethods().signUpUser(
          email: _emailController.text,
          firstName: _firstnameController.text,
          lastName: _lastnameController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          context: context,
        );
        // if string returned is sucess, user has been created
        if (res == "success") {
          setState(() {
            _isLoading = false;
          });
          // navigate to the login screen
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 500),
              child: const LoginScreen(),
            ),
          );
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => const LoginScreen()),
          // );
        } else {
          setState(() {
            _isLoading = false;
          });
          // show the error
          showSnackBar(context, res);
        }
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
                height: MediaQuery.of(context).size.height,
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          const Text(
                            'FRESHDA.',
                            style: TextStyle(
                                color: customPurple,
                                fontSize: 40,
                                fontFamily: 'LawyerGothic'),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
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
                            'Username',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'LawyerGothic',
                              color: grayMaintext,
                            ),
                          ),
                          TextFieldInput(
                            textInputType: TextInputType.text,
                            textEditingController: _usernameController,
                            textCapitalization: TextCapitalization.none,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'First Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'LawyerGothic',
                                        color: grayMaintext,
                                      ),
                                    ),
                                    TextFieldInput(
                                      textInputType: TextInputType.text,
                                      textEditingController:
                                          _firstnameController,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Last Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'LawyerGothic',
                                        color: grayMaintext,
                                      ),
                                    ),
                                    TextFieldInput(
                                      textInputType: TextInputType.text,
                                      textEditingController:
                                          _lastnameController,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'LawyerGothic',
                              color: grayMaintext,
                            ),
                          ),
                          TextFieldInput(
                            textInputType: TextInputType.text,
                            textEditingController: _passwordController,
                            textCapitalization: TextCapitalization.none,
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'LawyerGothic',
                              color: grayMaintext,
                            ),
                          ),
                          TextFieldInput(
                            textInputType: TextInputType.text,
                            textEditingController: _confpassController,
                            textCapitalization: TextCapitalization.none,
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.yellow.withOpacity(0.2),
                                spreadRadius: 6,
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  customYellow,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ))),
                            onPressed: () {
                              signUpUser();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const LoginScreen(),
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
                                    'REGISTER',
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
                          'ALREADY HAVE AN ACCOUNT?',
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
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'LawyerGothic',
                              color: customYellow,
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
