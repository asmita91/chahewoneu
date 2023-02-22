import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminEvent extends StatefulWidget {
  const  AdminEvent ({super.key});

  @override
  State< AdminEvent > createState() => _Event ();
}

class  _Event  extends State< AdminEvent > {
  TextEditingController event = new TextEditingController();
  TextEditingController event_description = new TextEditingController();
  File? pickedImage;

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          child: Container(
            color: Color.fromARGB(255, 200, 129, 224),
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Events'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),

          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.6), width: 2),
                  ),
                  child: ClipRect(
                    child: pickedImage != null
                        ? Image.file(
                      pickedImage!,
                      width: 500,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/-Insert_image_here-.svg/320px--Insert_image_here-.svg.png?20220802103107',
                      // width: 500,
                      // height: 800,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                onPressed: imagePickerOption,
                icon: const Icon(Icons.add_a_photo_sharp),
                label: const Text('Event Image')),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            controller: event,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Place";
              }
              if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                return "Please enter the Event name";
              }
              return null;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.place_sharp,
                color: Colors.black,
              ),
              hintText: "Event Name",
            ),
          ),
          SizedBox(
            height: 20,
            width: 10,
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            controller: event_description,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Event description is required";
              }
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.description,
                color: Colors.black,
              ),
              hintText: "Event description",
            ),
          ),
          SizedBox(
            height: 10,
            width:10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.event),
                label: const Text('Add Event')),
          ),
        ],
      ),
    );
  }
}