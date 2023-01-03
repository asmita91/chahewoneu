import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPayment extends StatefulWidget {
  const AdminPayment({Key? key}) : super(key: key);

  @override
  State<AdminPayment> createState() => _AdminPaymentState();
}

class _AdminPaymentState extends State<AdminPayment> {
  List name = [
    "asmita katel",
    "sanjeela thapa",
    "ritika shrestha",
    "diya dangol",
    "aayush pradhan",
    "asmita katel",
    "sanjeela thapa",
    "ritika shrestha",
    "diya dangol",
    "aayush pradhan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
