import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshda/constant.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  // final String hintText;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    // required this.hintText,
    required this.textInputType,
    required this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 7),
      margin: const EdgeInsets.only(top: 5),
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
      child: TextField(
        controller: textEditingController,
        textCapitalization: textCapitalization,
        autofocus: false,
        style: const TextStyle(
          fontSize: 20,
          color: customYellow,
        ),
        decoration: const InputDecoration(
          //labelText: 'Password',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
    // TextField(
    //   controller: textEditingController,
    //   textCapitalization: textCapitalization,
    //   style: AppTextStyles.textFields,
    //   decoration: InputDecoration(
    //     fillColor: graySubtextLight,
    //     hintText: hintText,
    //     hintStyle: AppTextStyles.subHeadings,
    //     border: InputBorder.none,
    //     focusedBorder: const OutlineInputBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //       borderSide: BorderSide(color: Colors.transparent, width: 2),
    //     ),
    //     enabledBorder: const OutlineInputBorder(
    //       borderSide: BorderSide(color: Colors.transparent),
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(10.0),
    //       ),
    //     ),
    //     filled: true,
    //     contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
    //   ),
    //   keyboardType: textInputType,
    //   obscureText: isPass,
    // );
  }
}
