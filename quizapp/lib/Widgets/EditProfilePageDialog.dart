import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Provider/PeriferanceProvider.dart';
import 'SettingIcons.dart';
import 'UnderlinedTextFormfield.dart';
import '../Controllers/student_controller.dart';

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({super.key});

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final String sampleimage =
      "https://plus.unsplash.com/premium_photo-1682724602143-a77d75d273b1?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww";
  // final String sampleimage = " ";
  File? _selectedImage;
  var PeriferianceState;
  var PeriferianceUpdate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    PeriferianceState = Provider.of<Periferance>(context);
    PeriferianceUpdate = Provider.of<Periferance>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: const BoxDecoration(
            // color: Theme.of(context).colorScheme.background,
            image: DecorationImage(
          image: AssetImage("Assets/Images/editprofilebg.png"),
          fit: BoxFit.cover,
          opacity: 0.5,
        )),
        height: size.height * 0.73,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit Profile",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontFamily: "wellcome"),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const SettingIcons(
                        icon: FontAwesomeIcons.circleXmark,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _pickImageFromGallery();
                  },
                  child: CachedNetworkImage(
                    imageUrl: "${PeriferianceState.getImage()}",
                    imageBuilder: (context, imageProvider) {
                      return CircleAvatar(
                          backgroundImage:
                              _selectedImage == null ? imageProvider : null,
                          backgroundColor: Colors.grey[100],
                          radius: 45.0,
                          child: _selectedImage != null
                              ? ClipOval(
                                  child: Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                    width: 90.0,
                                    height: 90.0,
                                  ),
                                )
                              : null);
                    },
                  ),
                ),
                UnderlinedTextFormfield(
                  inputController: _nameController,
                  hint: "${PeriferianceState.getName()}",
                  lable: "name",
                  expression: RegExp(r'^[a-zA-Z]{1,45}$'),
                ),
                UnderlinedTextFormfield(
                  inputController: _emailController,
                  hint: "${PeriferianceState.getEmail()}",
                  lable: "Email",
                  expression: RegExp(
                      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$'),
                ),
                UnderlinedTextFormfield(
                  inputController: _passwordController,
                  hint: "********",
                  lable: "Password",
                  expression: RegExp(r'^[\w\d]{8,}$'),
                ),
                UnderlinedTextFormfield(
                  inputController: _phoneController,
                  hint: "${PeriferianceState.getphone()}",
                  lable: "Phone",
                  expression: RegExp(r'^\d{10}$'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      await student_controller.updateProfile(
                        PeriferianceState.getStudentId(),
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                        _phoneController.text,
                        sampleimage,
                      );
                      await PeriferianceState.resetSharedPreferences(
                          _nameController.text,
                          _emailController.text,
                          _phoneController.text,
                          sampleimage);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  )),
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
