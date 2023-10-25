import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/login&signup/textfield.dart';
import 'package:expense_tracker/controller/reminder_controller.dart';
import 'package:expense_tracker/models/reminder_model/reminder_model.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScreenAddRemainder extends StatefulWidget {
  const ScreenAddRemainder({super.key});

  @override
  State<ScreenAddRemainder> createState() => _ScreenAddRemainderState();
}

class _ScreenAddRemainderState extends State<ScreenAddRemainder> {
  final formkey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  final dateController = TextEditingController();

  final timeController = TextEditingController();

  final amountController = TextEditingController();

  CatagoryType? selectedCatagoryType;
  TimeOfDay selectedTime = const TimeOfDay(hour: 4, minute: 30);

  final RemainderController remainderController =
      Get.put(RemainderController());

  @override
  Widget build(BuildContext context) {
    // print(remainderController.remainderCount);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add remainder',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              height30,
              CustomTextField(
                obscure: false,
                title: 'Title',
                validator: (value) {
                  return null;
                },
                controller: titleController,
              ),
              height30,
              CustomTextField(
                obscure: false,
                title: 'Date',
                validator: (value) {
                  return null;
                },
                controller: dateController,
                ontap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2024));

                  if (pickedDate != null) {
                    setState(() {});
                    dateController.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    // print(dateController.text);
                    // DateFormat('dd/MM/yyyy').format(pickedDate);
                  }
                },
              ),
              height30,
              CustomTextField(
                obscure: false,
                title: 'Time',
                validator: (value) {
                  return null;
                },
                controller: timeController,
                ontap: () async {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    // initialEntryMode: TimePickerEntryMode.dial,
                  ).then((value) {
                    setState(() {
                      selectedTime = value!;
                      timeController.text =
                          selectedTime.format(context).toString();
                    });
                  });
                },
              ),
              height30,
              CustomTextField(
                obscure: false,
                title: 'Amount',
                validator: (value) {
                  return null;
                },
                controller: amountController,
              ),
              height30,
              DropdownButtonFormField<CatagoryType>(
                hint: const Text('Payment mode '),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Appcolor.tertiaryColor, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Appcolor.tertiaryColor, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  fillColor: Appcolor.tertiaryColor,
                ),
                validator: (value) =>
                    value == null ? "Select Payment mode" : null,
                dropdownColor: Appcolor.tertiaryColor,
                value: selectedCatagoryType,
                onChanged: (CatagoryType? newValue) {
                  setState(() {
                    selectedCatagoryType = newValue!;

                    // print(selectedCatagoryType);
                  });
                },
                items: CatagoryType.values.map((CatagoryType mode) {
                  return DropdownMenuItem<CatagoryType>(
                    value: mode,
                    child: Text(mode
                        .toString()
                        .split('.')
                        .last), // To display the enum value as a string
                  );
                }).toList(),
              ),
              height50,
              CustomButton(
                  title: 'Add Remainder',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Remainder rem = Remainder(
                          description: titleController.text,
                          amount: int.parse(amountController.text),
                          date: DateTime.parse(dateController.text),
                          time: selectedTime,
                          type: selectedCatagoryType!);
                      remainderController.createRemainder(rem: rem);
                      // print("remainder created");
                      Get.back();
                    }
                  })
            ],
          ),
        ),
      )),
    );
  }
}
