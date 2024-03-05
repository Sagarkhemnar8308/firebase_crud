import 'dart:io';
import 'package:firebase_crud/homescreen.dart';
import 'package:firebase_crud/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Uint8List? image;
  File? selectedIamge;
  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final mobilecontroller = TextEditingController();
    final emailcontroller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                  hintText: "Name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: mobilecontroller,
              decoration: InputDecoration(
                  hintText: "Contact number", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  hintText: "email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () async {
                    String id = randomAlphaNumeric(30);
                    Map<String, dynamic> employeeInfoMap = {
                      "Name": namecontroller.text,
                      "Number": mobilecontroller.text,
                      "Email": emailcontroller.text,
                      "Id": id,
                    };
                    await ContactMethod()
                        .addEmployeeDetails(employeeInfoMap, id)
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Employee Added Successfull y..........................")));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    });
                  },
                  child: Text(
                    "Add User",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )
          ],
        )),
      ),
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            pickImageFromGallery();
                          },
                          child: Icon(
                            Icons.image,
                            size: 50,
                          ),
                        ),
                        Text("Gallery",
                            style:
                                TextStyle(color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickImageFromCamera();
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                          ),
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

//gallery
  Future pickImageFromGallery() async {
    final returnimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnimage == null) return;
    setState(() {
      selectedIamge = File(returnimage.path);
      image = File(returnimage.path).readAsBytesSync();
    });
  }

//camera
  Future pickImageFromCamera() async {
    final returnimage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnimage == null) return;
    setState(() {
      selectedIamge = File(returnimage.path);
      image = File(returnimage.path).readAsBytesSync();
    });
  }
}
