import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../constatnts/custom_widgets/common/sizedbox.dart';
import '../../constatnts/custom_widgets/login&signup/textfield.dart';
import 'package:intl/intl.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  final addFormkey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  final dateController = TextEditingController();

  final descriptionController = TextEditingController();

  final catagoryController = TextEditingController();

  final paymentController = TextEditingController();

  //String? selectedCatagory = null;
  String? selectedPaymentMode;

  List<DropdownMenuItem<String>> get paymentmode {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "cash", child: Text("By Cash")),
      const DropdownMenuItem(value: "bank", child: Text("By Bank")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: addFormkey,
            child: Column(
              children: [
                ToggleSwitch(
                  minWidth: 120,
                  minHeight: 50,
                  cornerRadius: 10,
                  fontSize: 20,
                  activeBgColor: const [
                    Appcolor.primaryColor,
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: const Color.fromARGB(255, 191, 224, 230),
                  totalSwitches: 2,
                  labels: const ['Income', 'Expense'],
                  onToggle: (index) {
                    if (index == 0) {
                      catagoryController.text = 'income';
                    } else {
                      catagoryController.text = 'expense';
                    }
                    print(catagoryController.text);
                  },
                ),
                height30,
                height20,
                CustomTextField(
                  obscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: amountController,
                  title: 'Amount',
                ),
                height30,
                CustomTextField(
                  readonly: true,
                  obscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: dateController,
                  title: 'Date',
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
                    }
                  },
                ),
                height30,
                CustomTextField(
                  obscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: descriptionController,
                  title: 'Description',
                ),
                height30,
                DropdownButtonFormField(
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
                    value: selectedPaymentMode,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPaymentMode = newValue!;
                      });
                    },
                    items: paymentmode),
                height30,
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: Get.width / 2.5,
                        child: Cancelbutton(
                            title: 'Cancel',
                            onTap: () {
                              Get.back();
                            })),

                    //CustomButton(title: 'Add', onTap: () {}),
                    SizedBox(
                        width: Get.width / 2.5,
                        child: CustomButton(
                            title: 'Add',
                            onTap: () {
                              Get.back();
                            })),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
