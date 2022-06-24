import 'package:flutter/material.dart';

Widget List_wid() {
  return ListView.builder(shrinkWrap: true,itemBuilder: (context, index) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.black,
    );
  });
}
