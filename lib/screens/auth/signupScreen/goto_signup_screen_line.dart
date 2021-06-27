import 'package:flutter/material.dart';

class GotoLoginScreenLine extends StatelessWidget {
  const GotoLoginScreenLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '''Already has an account? ''',
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            ''' Sign In''',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
