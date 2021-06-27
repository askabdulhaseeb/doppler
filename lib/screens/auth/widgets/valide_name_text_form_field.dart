import 'package:flutter/material.dart';

class ValideNameTextFormField extends StatefulWidget {
  final TextEditingController? _name;
  const ValideNameTextFormField({
    Key? key,
    @required TextEditingController? name,
  })  : _name = name,
        super(key: key);
  @override
  _ValideNameTextFormFieldState createState() =>
      _ValideNameTextFormFieldState();
}

class _ValideNameTextFormFieldState extends State<ValideNameTextFormField> {
  void onListener() => setState(() {});
  @override
  void initState() {
    widget._name!.addListener(onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget._name!.removeListener(onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
        controller: widget._name,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.name],
        validator: (value) {
          if (value!.length < 3) return 'Enter Correct Name';
          return null;
        },
        cursorColor: Colors.green,
        decoration: InputDecoration(
          hintText: 'Name',
          focusColor: Colors.green,
          prefix: Container(width: 10),
          suffixIcon: IconButton(
            splashRadius: 20,
            icon: (widget._name!.text.isEmpty)
                ? Container(width: 0)
                : const Icon(Icons.clear),
            onPressed: () => widget._name!.clear(),
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
