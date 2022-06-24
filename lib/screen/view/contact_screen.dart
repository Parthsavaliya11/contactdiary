import 'dart:io';

import 'package:contactdiary/screen/controller/listview.dart';
import 'package:contactdiary/screen/modal/modalclass.dart';
import 'package:contactdiary/utilis/constant/components/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class contact_screen extends StatefulWidget {
  const contact_screen({Key? key}) : super(key: key);

  @override
  State<contact_screen> createState() => _contact_screenState();
}

class _contact_screenState extends State<contact_screen> {
  List<String> Info = ["Delete", "About", "Delete All"];
  String Selected = "";
  TextEditingController txt_Name = TextEditingController();
  TextEditingController txt_Num = TextEditingController();
  List<String> Name =[];
  List<String> Number =[];
  var keys = GlobalKey<FormState>();
  var ke = GlobalKey<FormState>();

  File path = File("");
  File new_path = File("");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Contact Diary App',
            style: GoogleFonts.abrilFatface(
                fontWeight: FontWeight.w300, fontSize: 25, letterSpacing: 2),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              tooltip: "More Detail",
              elevation: 2,
              padding: EdgeInsets.all(5),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Delete"),
                    value: "Delete",
                  ),
                  PopupMenuItem(
                    child: Text("Add"),
                    value: "Add",
                  ),
                  PopupMenuItem(
                    child: Text("Remove All"),
                    value: "Remove All",
                  ),
                ];
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Form(
                    key: keys,
                    child: AlertDialog(
                      title: Center(
                        child: Text(
                          "Enter Person Detail",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            H(40),
                            GestureDetector(
                              onTap: () async {
                                ImagePicker imagepick = ImagePicker();

                                XFile? photo = await imagepick.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  path.delete();
                                  path = File(photo!.path);
                                });
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(path),
                                ),
                              ),
                            ),
                            H(40),
                            TextFormField(
                              controller: txt_Name,
                              decoration: InputDecoration(
                                  hintText: "Enter Person Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  border: OutlineInputBorder(),
                                  label: Text(
                                    "Name",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 20,
                                    color: Colors.black,
                                  )),
                              validator: (value) {
                                {
                                  if (value!.isEmpty) {
                                    return "Enter Person Name";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                            H(40),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                controller: txt_Num,
                                decoration: InputDecoration(
                                    hintText: "Enter Mobile Number",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      "Mobile No",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.mobile_friendly,
                                      size: 20,
                                      color: Colors.black,
                                    )),
                                validator: (value) {
                                  {
                                    if (value!.isEmpty) {
                                      return "Enter Contact Number";
                                    } else {
                                      return null;
                                    }
                                  }
                                }),
                            H(40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, '/');
                                  },
                                  child: Text("back"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (keys.currentState!.validate()) {
                                      Navigator.pop(context, '/');
                                    }
                                    setState(() {

                                    next();
                                    });

                                    txt_Name.clear();
                                    txt_Num.clear();
                                  },
                                  child: Text("Next"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  );
                });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Form(
          key: ke,
          child: Container(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: Name.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          height: 80,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 60,
                                    width: 60,
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(new_path),
                                    ),),
                                Text("${Name[index]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text("${Number[index]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
  void next()
  {
    setState(() {
   Name.insert(0, txt_Name.text);
   Number.insert(0, txt_Num.text);
   new_path = File(path.path);
    });
  }
}
