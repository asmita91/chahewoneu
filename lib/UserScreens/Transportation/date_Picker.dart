import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  //create datetime variable
  DateTime _dateTime=DateTime.now();
  // show date picker method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState((){
        _dateTime = value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //display chosen date
            Text(_dateTime.toString(),style: TextStyle(fontSize: 20)),

            //button
            MaterialButton(
              onPressed: _showDatePicker,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text ('choose date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
              ),
              color: Colors.blue ,
            ),
          ],
        ),
      ),
    );
  }
}
