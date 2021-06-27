import 'package:flutter/material.dart';

class ValidPasswordTextFormField extends StatefulWidget {
  final TextEditingController password;
  const ValidPasswordTextFormField({Key? key, required this.password})
      : super(key: key);

  @override
  _ValidPasswordTextFormFieldState createState() =>
      _ValidPasswordTextFormFieldState();
}

class _ValidPasswordTextFormFieldState
    extends State<ValidPasswordTextFormField> {
  bool _isVisible = false;
  void onListener() => setState(() {});
  @override
  void initState() {
    super.initState();
    widget.password.addListener(onListener);
  }

  @override
  void dispose() {
    widget.password.removeListener(onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: TextFormField(
        controller: widget.password,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: _isVisible,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.green,
        decoration: InputDecoration(
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _isVisible = !_isVisible;
            }),
            icon: (_isVisible == true)
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(Icons.remove_red_eye),
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
