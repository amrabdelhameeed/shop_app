// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:shop_app/utils/size_config.dart';

// Updated by Baly
class MyTextFormField extends StatefulWidget {
  MyTextFormField({
    Key? key,
    required this.hint,
    this.controller,
    this.inputType,
    this.isPassword = false,
    this.validationText,
    this.radius = 10,
  }) : super(key: key);
  final String hint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool isPassword;
  final String? validationText;
  double radius;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  late bool isPass;
  IconData suffix = Icons.visibility_off_outlined;
  @override
  void initState() {
    isPass = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! / 2),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(context).textTheme.headline2!.color),
        controller: widget.controller,
        obscureText: isPass,
        keyboardType: widget.inputType,
        validator: (arg) {
          if (arg!.length < 3)
            return 'Please enter a valid input';
          else
            return null;
        },
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      isPass = !isPass;
                      suffix = isPass
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined;
                    });
                  },
                  child: Icon(suffix),
                )
              : const SizedBox(),
          contentPadding: const EdgeInsets.all(20.0),
          hintText: widget.hint,
          errorStyle: const TextStyle(
            fontFamily: 'SFPro',
          ),
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
// widget.isPassword! ? showPass : false