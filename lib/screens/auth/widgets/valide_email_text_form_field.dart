import 'package:flutter/material.dart';

class ValideEmailTextFormField extends StatefulWidget {
  final TextEditingController? _email;
  const ValideEmailTextFormField({
    Key? key,
    @required TextEditingController? email,
  })  : _email = email,
        super(key: key);
  @override
  _ValideEmailTextFormFieldState createState() =>
      _ValideEmailTextFormFieldState();
}

class _ValideEmailTextFormFieldState extends State<ValideEmailTextFormField> {
  void onListener() => setState(() {});
  @override
  void initState() {
    widget._email!.addListener(onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget._email!.removeListener(onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
        controller: widget._email,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.email],
        validator: (value) {
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!)) {
            return 'Email is Invalide';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Email',
          prefix: Container(width: 10),
          suffixIcon: IconButton(
            splashRadius: 20,
            icon: (widget._email!.text.isEmpty)
                ? Container(width: 0)
                : const Icon(Icons.clear),
            onPressed: () => widget._email!.clear(),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.green, width: 0.5),
          ),
        ),
      ),
    );
  }
}
