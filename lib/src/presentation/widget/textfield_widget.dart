import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const TextFieldWidget(
      {super.key,
      required this.onTap,
      required this.hintText,
      required this.icon,
      required this.keyboardType,
      required this.controller,
      required this.validator});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black26),
          suffixIcon: IconButton(
            icon: widget.icon,
            onPressed: () {setState(() {
               widget.onTap;
            });
             
              // setState(() {
              //   _obscureText = !_obscureText;
              // });
            },
          )),
      obscureText: _obscureText,
    );
  }
}
