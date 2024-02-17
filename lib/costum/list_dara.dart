import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CostumTextfeild extends StatelessWidget {
  final String labelText;
  final TextEditingController controler;
  final String hintText;
  final String? Function(String? value) validater;
  final Widget PrifixIcon;

  CostumTextfeild(
      {required this.labelText,
      required this.controler,
      required this.hintText,
      required this.validater,
      required this.PrifixIcon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return TextFormField(
      validator: validater,
      controller: controler,
      decoration: InputDecoration(
        prefixIcon: PrifixIcon,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
