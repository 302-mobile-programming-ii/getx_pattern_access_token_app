import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  bool? onLoading;
  String? title;
  ButtonCustomWidget({super.key, this.onLoading = false, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: onLoading == true
            ? CircularProgressIndicator(color: Colors.white)
            : Text(title ?? "", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
