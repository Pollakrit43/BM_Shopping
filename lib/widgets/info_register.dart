import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/account_check/account_check.dart';
import 'package:flutter_ecom/screens/login/login_screen.dart';
import 'package:flutter_ecom/widgets/widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class InfoRegister extends StatefulWidget {
  const InfoRegister({super.key});

  @override
  State<InfoRegister> createState() => _InfoRegisterState();
}

class _InfoRegisterState extends State<InfoRegister> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _fullNameController =
      TextEditingController(text: "");
  final TextEditingController _emailTextController =
      TextEditingController(text: "");
  final TextEditingController _passwordTextController =
      TextEditingController(text: "");
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "");

  File? imageFile;
  String? imageUrl;
  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Please choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  //getFromCamera
                  _getFromCamera();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.camera,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  //getFromGallery
                  _getFromGallery();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _getFromCamera() async {
    XFile? pickFile = await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(pickFile!.path);
  }

  void _getFromGallery() async {
    XFile? pickFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(pickFile!.path);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);

    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.05,
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              //create show image dialog
              _showImageDialog();
            },
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Color.fromARGB(255, 116, 115, 115),
              backgroundImage: imageFile == null
                  ? AssetImage("assets/images/avatar.png")
                  : Image.file(imageFile!).image,
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          InputField(
            hintText: 'Enter FullName',
            icon: Icons.person,
            obscureText: false,
            textEditingController: _fullNameController,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          InputField(
            hintText: 'Enter Email',
            icon: Icons.email_rounded,
            obscureText: false,
            textEditingController: _emailTextController,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          InputField(
            hintText: 'Enter Password',
            icon: Icons.lock,
            obscureText: true,
            textEditingController: _passwordTextController,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          InputField(
            hintText: 'Enter PhoneNumber',
            icon: Icons.phone,
            obscureText: false,
            textEditingController: _phoneNumberController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          ButtonSquare(
            text: "Create Account",
            colors1: Colors.white60,
            colors2: Colors.white60,
            press: () async {
              if (imageFile == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select an Image'),
                  ),
                );
              }
              try {
                final ref = FirebaseStorage.instance
                    .ref()
                    .child('userImages')
                    .child(DateTime.now().toString() + '.jpg');

                await ref.putFile(imageFile!);
                imageUrl = await ref.getDownloadURL();
                await _auth.createUserWithEmailAndPassword(
                  email: _emailTextController.text.trim().toLowerCase(),
                  password: _passwordTextController.text.trim(),
                );
                final User? user = _auth.currentUser;
                final _uid = user!.uid;
                FirebaseFirestore.instance.collection('users').doc(_uid).set({
                  'id': _uid,
                  'userImage': imageUrl,
                  'name': _fullNameController.text,
                  'email': _emailTextController.text,
                  'phoneNumber': _phoneNumberController.text,
                  'createAt': Timestamp.now(),
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          AccountCheck(
            login: false,
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
