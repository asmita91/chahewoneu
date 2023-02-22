import 'package:chahewoneu/viewmodels/payment_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../UserScreens/navpages/app_icon.dart';
import '../../models/AdminPaymentModel.dart';

class AdminPayment extends StatefulWidget {
  const AdminPayment({Key? key}) : super(key: key);

  @override
  State<AdminPayment> createState() => _AdminPaymentState();
}

class _AdminPaymentState extends State<AdminPayment> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late PaymentViewModel _paymentViewModel;
  @override
  void initState() {
    _paymentViewModel = Provider.of<PaymentViewModel>(context, listen: false);
    _paymentViewModel.getPayment();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var payment = context.watch<PaymentViewModel>().payment;
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            // AppIcon(icon: Icons.arrow_back),
            // SizedBox(
            //   width: 5,
            // ),
            Text(
              "Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        )),
        body: StreamBuilder(
            stream: payment,
            builder: (context,
                AsyncSnapshot<QuerySnapshot<AdminPaymentModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return ListView(children: [
                  ...snapshot.data!.docs.map((document) {
                    AdminPaymentModel payment = document.data();
                    return ListTile(
                      leading: Container(
                        width: MediaQuery.of(context).size.height / 20,
                        height: MediaQuery.of(context).size.height / 20,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("Images/hiace.png"),
                        ),
                      ),
                      title: Text(payment.userName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              // Here is the explicit parent TextStyle
                              style: new TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                new TextSpan(text: 'Total received is: '),
                                new TextSpan(
                                  text: payment.packagePrice.toString(),
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Text("payment successfully received!!!",
                              style: TextStyle(color: Colors.green))
                        ],
                      ),
                    );
                  })
                ]);
              }
            }));
  }
}
