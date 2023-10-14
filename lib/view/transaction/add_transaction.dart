import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../constatnts/custom_widgets/common/sizedbox.dart';
import '../../constatnts/custom_widgets/login&signup/textfield.dart';

class ScreenAddTransaction extends StatefulWidget {
  ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  final formkey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  final dateController = TextEditingController();

  final descriptionController = TextEditingController();

  final catagoryController = TextEditingController();

  final paymentController = TextEditingController();
  String? selectedCatagory = null;
  String? selectedPaymentMode = null;

  List<DropdownMenuItem<String>> get catagory {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Income"), value: "income"),
      DropdownMenuItem(child: Text("Expense"), value: "expense"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get paymentmode {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("By Cash"), value: "cash"),
      DropdownMenuItem(child: Text("By Bank"), value: "bank"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
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
                  // print('$index');
                },
              ),
              height30,
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
                obscure: false,
                validator: (value) {
                  return null;
                },
                controller: dateController,
                title: 'Date',
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month_outlined)),
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
                  hint: Text('Catagory '),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Appcolor.tertiaryColor, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Appcolor.tertiaryColor, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    fillColor: Appcolor.tertiaryColor,
                  ),
                  validator: (value) =>
                      value == null ? "Select Catagory" : null,
                  dropdownColor: Appcolor.tertiaryColor,
                  value: selectedCatagory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCatagory = newValue!;
                    });
                  },
                  items: catagory),
              height30,
              DropdownButtonFormField(
                  hint: Text('Payment mode '),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Appcolor.tertiaryColor, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Appcolor.tertiaryColor, width: 1),
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
    );
  }
}
