

import 'package:contactdiary/screen/view/contact_screen.dart';
import 'package:flutter/material.dart';
void main()
{

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false ,
    routes: {
      '/': (context) => contact_screen(),
    },

  ),);
}