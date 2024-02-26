import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.isPasswordField = false,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final String hintText;
  final bool isPasswordField;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      cursorColor: Colors.blueGrey,
      validator: widget.validator,
      keyboardType: TextInputType.text,
      obscureText: widget.isPasswordField ? hidePassword : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPasswordField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                child: hidePassword == true
                    ? Icon(
                        Icons.visibility,
                        color: Colors.grey.shade700,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Colors.grey.shade700,
                      ),
              )
            : null,
        isDense: true,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
