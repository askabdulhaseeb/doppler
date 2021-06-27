import 'package:flutter/material.dart';

Future showLoadingDislog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
