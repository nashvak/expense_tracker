import 'package:expense_tracker/constatnts/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.icon,
      this.ontap,
      this.type,
      required this.validator,
      required this.controller,
      required this.title,
      super.key});
  final Icon? icon;
  final String title;

  final String? Function(String?) validator;
  final TextEditingController controller;
  final void Function()? ontap;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      controller: controller,
      validator: validator,
      keyboardType: type,
      cursorColor: const Color.fromARGB(255, 120, 120, 120),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: title,
        prefixIcon: icon,
        fillColor: Appcolor.tertiaryColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
      ),
    );
  }
}

class AddTransactionTextField extends StatelessWidget {
  const AddTransactionTextField(
      {this.ontap,
      this.type,
      this.readonly = false,
      required this.validator,
      required this.controller,
      required this.title,
      this.numberonly,
      super.key});

  final String title;

  final String? Function(String?) validator;
  final TextEditingController controller;
  final void Function()? ontap;
  final TextInputType? type;
  final bool readonly;
  final List<TextInputFormatter>? numberonly;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: Get.width * 0.5,
          child: TextFormField(
            onTap: ontap,
            readOnly: readonly,
            controller: controller,
            validator: validator,
            keyboardType: type,

            inputFormatters: numberonly,
            //  autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: const Color.fromARGB(255, 120, 120, 120),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Appcolor.secondaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Appcolor.primaryColor),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
