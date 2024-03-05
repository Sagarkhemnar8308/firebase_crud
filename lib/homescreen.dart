import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/services/database.dart';
import 'package:flutter/material.dart';

import 'add_user_form_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _namecontroller = TextEditingController();
  final _ageController = TextEditingController();
  final _locationController = TextEditingController();
  Stream? employeeStream;

  getontheload() async {
    employeeStream = await ContactMethod().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: employeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          height: 100,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name : " + ds["Name"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                "Mobile Number : " + ds["Number"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          "email : " + ds['Email'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            _namecontroller.text = ds['Name'];
                                            _ageController.text = ds["Number"];
                                            _locationController.text =
                                                ds["Email"];
                                            editEmployeeData(ds["Id"]);
                                          },
                                          child: Icon(Icons.edit)),
                                      InkWell(
                                          onTap: () async {
                                            await ContactMethod()
                                                .deleteEmployeeDetails(
                                                    ds["Id"]);
                                          },
                                          child: Icon(Icons.delete)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                )
              : SizedBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 50,
        width: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormPage(),
                  ));
            },
            child: Text(
              " + Add User",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Firebase Crud Method "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(child: allEmployeeDetails()),
           
          ],
        ),
      ),
    );
  }

  Future editEmployeeData(String id) => showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text("Edit user ..............."),
            ),
            body: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                          hintText: "Name", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                          hintText: "number", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _locationController,
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Map<String, dynamic> updateInfo = {
                              "Name": _namecontroller.text,
                              "Number": _ageController.text,
                              "Email": _locationController.text,
                              "Id": id
                            };
                            ContactMethod()
                                .updateEmployeeDetails(id, updateInfo)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            });
                          },
                          child: Text(
                            "Edit data",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                )),
          );
        },
      );
}
