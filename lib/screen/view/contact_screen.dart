import 'package:contactdiary/utilis/constant/components/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Form(
          key: keys,
          child: Container(
            child: Column(children: [
              Expanded(
                  child: Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: FloatingActionButton(
                          backgroundColor: Colors.black,
                          tooltip: "Add",
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Enter Person Detail",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: Column(
                                      children: [
                                        TextFormField(
                                          key: keys,
                                          decoration: InputDecoration(
                                            
                                            hintText: "Enter Person Name",
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1  ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2  ),
                                              ),
                                              border: OutlineInputBorder(),label: Text("Name",style: TextStyle(color: Colors.black),),prefixIcon: Icon(Icons.person,size: 20,color: Colors.black,)),
                                        ),
                                        H(20),
                                        TextFormField(

                                          decoration: InputDecoration(

                                            hintText: "Enter Mobile Number",
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1  ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2  ),
                                              ),
                                              border: OutlineInputBorder(),label: Text("Mobile No",style: TextStyle(color: Colors.black),),prefixIcon: Icon(Icons.person,size: 20,color: Colors.black,)),
                                        ),
                                      ],
                                    ),
                                    backgroundColor: Colors.white,
                                  );
                                });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      )))
            ]),
          ),
        ),
      ),
    );
  }
}
