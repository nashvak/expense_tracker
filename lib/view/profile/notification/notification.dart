import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/date&time_controller/time_picker.dart';

import 'package:expense_tracker/view/profile/notification/notification_settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final TimePicker time = Get.put(TimePicker());
  NotificationServices notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
                BlankSpace(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                      'You can now set the alarm directly on Money Manager, Therefore Money manager would remind you at your selected time of the day to the key in your data.'),
                )
              ],
            ),
            const BlankSpace(
              height: 20,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              trailing: GetBuilder<TimePicker>(
                init: TimePicker(),
                builder: (controller) {
                  return Switch.adaptive(
                    value: controller.isNotification,
                    onChanged: (value) {
                      controller.onToggle(value);
                    },
                  );
                },
              ),
              title: const Text('Show notifications'),
            ),
            const BlankSpace(
              height: 30,
            ),
            GetBuilder<TimePicker>(
              builder: (controller) {
                if (controller.selectedTime != null) {
                  return Visibility(
                    visible: controller.isVisibility,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Set Time",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(controller.selectedTime!.format(context)),
                          trailing: GestureDetector(
                            onTap: () {
                              controller.pickTime();
                            },
                            child: const Icon(Icons.alarm),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            // height20,
          ],
        ),
      ),
//             ElevatedButton(
//               onPressed: () {
// // notificationServices.scheduleNotification(
// //                     title: 'Hey',
// //                     body: ' Did you record your daily transactions',
// //                     scheduledNotificationDateTime: time.selectedTime)
//               },
//               child: const Text('send notification'),
//             ),
    );
  }
}
