import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../custom_widgets/common/sizedbox.dart';
import '../../custom_widgets/loginPage/login_widgets.dart';

class ScreenAddTransaction extends StatelessWidget {
  const ScreenAddTransaction({super.key});

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
              activeBgColor: [
                Appcolor.primaryColor,
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Color.fromARGB(255, 191, 224, 230),
              totalSwitches: 2,
              labels: ['Income', 'Expense'],
              onToggle: (index) {
                print('$index');
              },
            ),
            height30,
            CustomTextField(
              title: 'Amount',
            ),
            height30,
            CustomTextField(
              title: 'Date',
              icon: Icon(Icons.calendar_month),
            ),
            height30,
            CustomTextField(
              title: 'Description',
            ),
            height30,
            CustomTextField(
              title: 'Catagory',
            ),
            height30,
            CustomTextField(
              title: 'Payment mode',
            ),
            // DropdownButton(items: [], onChanged: ((value) {

            // })),
            height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Cancelbutton(title: 'Cancel', onTap: () {})),

                //CustomButton(title: 'Add', onTap: () {}),
                Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: CustomButton(title: 'Add', onTap: () {})),
              ],
            )
          ],
        ),
      ),
    );
  }
}
