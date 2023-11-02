import 'dart:io';
import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AuthController authController = Get.put(
    AuthController(),
  );

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  final editformkey = GlobalKey<FormState>();
  @override
  void initState() {
    AuthModel user = authController.authBox.getAt(0);
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    super.initState();
  }

  XFile? image;

  cameraOrGallery() {
    Get.bottomSheet(
        backgroundColor: Appcolor.tertiaryColor,
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Appcolor.white,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              height20,
              Container(
                color: Appcolor.white,
                child: Wrap(
                  children: [
                    ListTile(
                      onTap: () async {
                        image = await authController.getImag(true);
                        Get.back();
                      },
                      leading: const Icon(Icons.camera),
                      title: const Text('Camera'),
                    ),
                    ListTile(
                      onTap: () async {
                        image = await authController.getImag(false);
                        Get.back();
                      },
                      leading: const Icon(Icons.photo),
                      title: const Text('Gallery'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  editProfile() {
    if (editformkey.currentState!.validate()) {
      AuthModel user = authController.authBox.getAt(0);
      String? imageUrl = (image == null) ? user.image : image!.path;
      authController.updateUser(
        index: 0,
        auth: AuthModel(
          name: nameController.text,
          email: emailController.text,
          password: user.password,
          image: imageUrl,
        ),
      );
      Get.back();
    } else {
      Get.snackbar('Error', 'Error occured while creating user');
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthModel user = authController.authBox.getAt(0);
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 28),
        backgroundColor: Colors.transparent,
        title: Text(
          'Edit Profile',
          style: screenTitleText(),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                editProfile();
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: editformkey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cameraOrGallery();
                    },
                    child: GetBuilder<AuthController>(
                      builder: (controller) {
                        return (image == null)
                            ? Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Appcolor.tertiaryColor,
                                      backgroundImage:
                                          FileImage(File(user.image!)),
                                    ),
                                  ),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Appcolor.secondaryColor,
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Appcolor.tertiaryColor,
                                      backgroundImage: FileImage(
                                        File(image!.path),
                                      ),
                                    ),
                                  ),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.edit,
                                      color: Appcolor.secondaryColor,
                                    ),
                                  ),
                                ],
                              );
                        // : Stack(
                        //     alignment: Alignment.bottomCenter,
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.all(10.0),
                        //         child: CircleAvatar(
                        //           radius: 50,
                        //           backgroundColor:
                        //               Appcolor.tertiaryColor,
                        //           backgroundImage: FileImage(
                        //             File(
                        //               image!.path,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       const CircleAvatar(
                        //         radius: 15,
                        //         backgroundColor: Colors.white,
                        //         child: Icon(
                        //           Icons.edit,
                        //           color: Appcolor.secondaryColor,
                        //         ),
                        //       ),
                        //     ],
                        //   );
                      },
                    ),
                  ),
                  height30,
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  height30,
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
