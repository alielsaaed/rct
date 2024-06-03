import 'package:flutter/material.dart';
import 'package:rct/constants/constants.dart';

class PasswordFormFieldCustom extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final void Function(String) onChanged;

  const PasswordFormFieldCustom(
      {Key? key,
      required this.labelText,
      required this.controller,
      required this.onChanged})
      : super(key: key);

  @override
  State<PasswordFormFieldCustom> createState() =>
      _PasswordFormFieldCustomState();
}

class _PasswordFormFieldCustomState extends State<PasswordFormFieldCustom> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        // contentPadding: length == 0 ? null : EdgeInsets.only(bottom: length),
        labelText: widget.labelText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: grey.withOpacity(0.5),
        filled: true,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: darkGrey,
              overflow: TextOverflow.clip,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        // labelStyle: const TextStyle(color: Colors.black45),
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: grey,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}


