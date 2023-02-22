import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../ViewModel/PlaceViewModel.dart';
import '../models/event_model.dart';
import '../viewmodels/event_viewmodel.dart';

class EventAdd extends StatefulWidget {
  const EventAdd({super.key});

  @override
  State<EventAdd> createState() => _EventAdd();

}

class _EventAdd extends State<EventAdd> {

  TextEditingController event_name = new TextEditingController();
  TextEditingController event_description = new TextEditingController();
  TextEditingController event_location = new TextEditingController();
  int id = new DateTime.now().millisecondsSinceEpoch;
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
            color: Colors.blue,
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
  Future<void> add_event(event_viewmodel) async {
    if (pickedImage == null) {
      // ScaffoldMessenger.of(context).showSnackBar(snackBar)
      return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();
    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef.child("event").child("$dt.jpg").putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();
    final data = EventModel(
      eventId: id.toString(),
      eventName: event_name.text,
      eventDescription: event_description.text,
      eventLocation: event_location.text,
      imagepath: photo.ref.fullPath,
      imageUrl: url,
    );
    db.collection("event").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("event added")));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  label: const Text('Image here')),
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: event_name,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Event";
                }
                if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                  return "Please enter the event name";
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.nature_people,
                  color: Colors.black,
                ),
                hintText: "event name",
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
                  return "event description is required";
                }
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.description,
                  color: Colors.black,
                ),
                hintText: "event description",
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: event_location,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Event location is required";
                }
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.money,
                  color: Colors.black,
                ),
                hintText: "event location required",
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    add_event(EventViewModel);
                  },
                  icon: const Icon(Icons.place_outlined),
                  label: const Text('Add Event')),
            ),

          ],
        ),
      ),
    );
  }
}
