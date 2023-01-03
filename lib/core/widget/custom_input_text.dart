import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final InputBorder? inputBorder;
  final ValueChanged<String>? onChanged;
  const CustomInput({Key? key, this.onChanged, this.hintText, this.inputBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        onChanged: (val) => onChanged!(val),
        decoration: InputDecoration(hintText: hintText!, border: inputBorder),
      ),
    );
  }
}
