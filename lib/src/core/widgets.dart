import 'package:flutter/material.dart';

Widget buildImagePlaceholder({required double width, required double height}) {
  return
      //  Padding(
      // padding: const EdgeInsetsDirectional.only(end: 14),
      // child:
      ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.8),
      ),
      child: const Icon(Icons.image_not_supported),
    ),
    // ),
  );
}
