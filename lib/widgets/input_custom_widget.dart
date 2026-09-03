import 'package:flutter/material.dart';

class InputCustomWidget extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  InputCustomWidget({super.key, this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hint: Text(hint ?? ""),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
