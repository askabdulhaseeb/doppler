import 'package:flutter/material.dart';

class ValidEmailTextFormField extends StatefulWidget {
  final TextEditingController email;
  const ValidEmailTextFormField({Key? key, required this.email})
      : super(key: key);

  @override
  _ValidEmailTextFormFieldState createState() =>
      _ValidEmailTextFormFieldState();
}

class _ValidEmailTextFormFieldState extends State<ValidEmailTextFormField> {
  void onListener() => setState(() {});
  @override
  void initState() {
    super.initState();
    widget.email.addListener(onListener);
  }

  @override
  void dispose() {
    widget.email.removeListener(onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: TextFormField(
        controller: widget.email,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!)) {
            return 'Email is Invalide';
          }
          return null;
        },
        cursorColor: Colors.green,
        decoration: InputDecoration(
          hintText: 'Email',
          suffixIcon: IconButton(
            icon: (widget.email.text.isEmpty)
                ? Container(width: 0)
                : const Icon(Icons.clear),
            onPressed: () => widget.email.clear(),
          ),
          focusColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
