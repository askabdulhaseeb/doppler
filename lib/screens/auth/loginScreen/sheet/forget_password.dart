import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: const Text(
          'Forget Password?',
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}
