import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../custom_widgets/common/sizedbox.dart';
import '../../custom_widgets/login&signup/textfield.dart';

class ScreenAddTransaction extends StatelessWidget {
  ScreenAddTransaction({super.key});
  final formkey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  final catagoryController = TextEditingController();
  final paymentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                print('$index');
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
              icon: Icon(Icons.calendar_month),
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
            CustomTextField(
              obscure: false,
              validator: (value) {
                return null;
              },
              controller: catagoryController,
              title: 'Catagory',
            ),
            height30,
            CustomTextField(
              obscure: false,
              controller: paymentController,
              validator: (value) {
                return null;
              },
              title: 'Payment mode',
            ),
            // DropdownButton(items: [], onChanged: ((value) {

            // })),
            height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: Get.width / 2.5,
                    child: Cancelbutton(title: 'Cancel', onTap: () {})),

                //CustomButton(title: 'Add', onTap: () {}),
                Container(
                    width: Get.width / 2.5,
                    child: CustomButton(title: 'Add', onTap: () {})),
              ],
            )
          ],
        ),
      ),
    );
  }
}
