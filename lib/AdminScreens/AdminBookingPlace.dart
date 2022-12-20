import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookingPlace extends StatefulWidget {
  const  BookingPlace({super.key});

  @override
  State< BookingPlace> createState() => _BookingPlace();
}

class  _BookingPlace extends State< BookingPlace> {
  TextEditingController place = new TextEditingController();
  TextEditingController place_description = new TextEditingController();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add place'),
      ),
    );
  }
}