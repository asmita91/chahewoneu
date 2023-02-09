import 'package:chahewoneu/model/CarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  String status = "false";

  Future<void> saveCar() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    var text;
    final data = CarModel(status: true, userId: "1", userName: "Asmita");

    db.collection("cars").add(data.toJson()).then((value) {
      print("Added Data with ID: ${value.id}");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Car Added")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreenAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Are you sure you want to rent it?"),
            content: Text("The best car you can ever rent!! Its the brand "
                "new Hyundai Creta i.e 5 seater car, comfortable enough to drop you on your destination."),
            actions: [
              TextButton(
                  onPressed: () {
                    status = "true";
                    saveCar();
                  },
                  child: Text(
                    "Book",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ],
          ),
        );
      },
      child: Text("Rent It"),
    );
  }
}
