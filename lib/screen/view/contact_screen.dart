import 'dart:io';




import 'package:contactdiary/screen/controller/listview.dart';
import 'package:contactdiary/screen/modal/modalclass.dart';
import 'package:contactdiary/utilis/constant/components/sizedbox.dart';
import 'package:flutter/material.dart';
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
  String? Number;
  String? Name;
  Key keys = GlobalKey();
  ImagePicker imagepick = ImagePicker();
  File path = File("");
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

        floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,child: Icon(Icons.add),onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(80),
                  child: AlertDialog(
                    title: Center(
                      child: Text(
                        "Enter Person Detail",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                    content: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            XFile? photo =
                            await imagepick.pickImage(
                                source: ImageSource
                                    .gallery);
                            setState(() {
                              path = photo!.path as File;
                            });
                          },
                          child: Container(
                            height: 85,
                            width: 85,
                            child: CircleAvatar(
                              backgroundImage:
                              FileImage(path),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: txt_Name,
                          decoration: InputDecoration(
                              hintText: "Enter Person Name",
                              enabledBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1),
                              ),
                              focusedBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(),
                              label: Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.black,
                              )),
                        ),
                        TextFormField(
                          controller: txt_Num,
                          decoration: InputDecoration(

                              hintText:
                              "Enter Mobile Number",
                              enabledBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1),
                              ),
                              focusedBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(),
                              label: Text(
                                "Mobile No",
                                style: TextStyle(
                                    color: Colors.black),
                              ),
                              prefixIcon: Icon(
                                Icons.mobile_friendly,
                                size: 20,
                                color: Colors.black,
                              )),
                        ),
                        H(10),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(onPressed: (){
                              Navigator.pop(context,'/');
                            }, child: Text("back"),style: ElevatedButton.styleFrom(primary: Colors.black),),
                            ElevatedButton(onPressed: (){
                              Name = txt_Name.text;
                              Number = txt_Num.text;
                              modelClass detail = modelClass(path, Number, Name);
                            }, child: Text("Next"),style: ElevatedButton.styleFrom(primary: Colors.black),),
                          ],
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              });
        },),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Form(
          key: keys,
          child: Container(
            child: Column(children: [

            ]),
      ),
    ),
   ),
    );
   }
}
