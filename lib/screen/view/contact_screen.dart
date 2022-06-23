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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Contact Diary App',
            style: GoogleFonts.cinzel(fontWeight: FontWeight.bold,fontSize: 25),
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
        body: Container(
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
    );
  }
}
