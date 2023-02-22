// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:khalti/khalti.dart';
// import 'package:khalti_core/khalti_core.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// class KhaltiPayment extends StatefulWidget {
//   const KhaltiPayment({Key? key}) : super(key: key);
//
//   @override
//   State<KhaltiPayment> createState() => _KhaltiPaymentState();
// }
//
// class _KhaltiPaymentState extends State<KhaltiPayment> {
//   String referenceId = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Payment Methods",
//                 style: TextStyle(
//                   fontSize: 28,
//                   color: Color.fromARGB(255, 92, 15, 163),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(
//                 color: Color.fromARGB(255, 92, 15, 163),
//                 height: 20,
//                 thickness: 1,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//
//               //Image for Khalti
//               InkWell(
//                 splashColor: Colors.grey,
//                 onTap: () {
//                   print("Image Tapped");
//                   khaltiWallet();
//                 }, // Image tapped
//                 child: Image.asset(
//                   'Images/khalti.png',
//                   width: 180,
//                 ),
//               ),
//
//               SizedBox(
//                 height: 40,
//               ),
//
//               //Cash on Delivery
//               InkWell(
//                 splashColor: Colors.grey,
//                 onTap: () {
//                   AlertDialog(
//                     title: const Text("Cash on Delivery"),
//                     content: const Text("Payment successful"),
//                     actions: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("OK"))
//                     ],
//                   );
//                 },
//                 child: Image.asset(
//                   'Images/ime.png',
//                   width: 100,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               InkWell(
//                 splashColor: Colors.grey,
//                 onTap: () {
//                   AlertDialog(
//                     title: const Text("Cash on Delivery"),
//                     content: const Text("Payment successful"),
//                     actions: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("OK"))
//                     ],
//                   );
//                 },
//                 child: Image.asset(
//                   'Images/visa.png',
//                   width: 150,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Divider(
//                 color: Color.fromARGB(255, 92, 15, 163),
//                 height: 20,
//                 thickness: 1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   khaltiWallet() {
//     KhaltiScope.of(context).pay(
//       config: PaymentConfig(
//           amount: 1000,
//           productIdentity: "1",
//           productName: "Pokhata",
//           mobile: "9866622390"),
//       preferences: [PaymentPreference.khalti],
//       onSuccess: onSuccess,
//       onFailure: onFailure,
//       onCancel: onCanceled,
//     );
//   }
//
//   // mentod to handle success
//   void onSuccess(PaymentSuccessModel success) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Success"),
//             content: Text("Payment successful"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         });
//   }
//
//   // method to handle failure
//   void onFailure(PaymentFailureModel failure) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Failure"),
//             content: Text("Payment failed"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("OK"))
//             ],
//           );
//         });
//   }
//
//   // method to handle onCanceled
//
//   void onCanceled() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Canceled"),
//             content: Text("Payment canceled"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("OK"))
//             ],
//           );
//         });
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../icons.dart';



class Payment extends StatefulWidget {
  const Payment ({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}
class  _PaymentState extends State<Payment> {
  String? payment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF90A4AE),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 130,
                      width: 20,
                    ),
                    CustomIcon(
                      icon: Icons.arrow_back,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      height: 130,
                      width: 30,
                    ),
                    Container(
                      child: const Text("Payment Methods",
                        style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           TextButton(
                      //             onPressed: () {},
                      //             child: const Text(
                      //               'Total Amount',
                      //               style: TextStyle(color: Color.fromRGBO(
                      //                   21, 34, 56, 1.0), fontSize: 17),
                      //             ),
                      //           )
                      //         ],
                      //       ),



                      // Container(
                      //   // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      //   decoration: BoxDecoration(
                      //     color: Color.fromARGB(255, 230, 244, 252),
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     inputFormatters: <TextInputFormatter>[
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     obscureText: false,
                      //     decoration: const InputDecoration(
                      //         border: InputBorder.none,
                      //         // label: Text("Password"),
                      //         hintText: "Enter Amount to Pay",
                      //         prefixIcon: Icon(Icons.payment)),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                RadioListTile(
                  title: const Text("Cash On Delivery",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: "COD",
                  groupValue: payment,
                  onChanged: (value){
                    setState(() {
                      payment = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Esewa",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: "Esewa",
                  groupValue: payment,
                  onChanged: (value){
                    setState(() {
                      payment = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Khalti",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: "Khalti",
                  groupValue: payment,
                  onChanged: (value){
                    setState(() {
                      payment = value.toString();
                    });
                  },
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => LoginScreen(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 20, 79, 189),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),

                    child: const Text("Pay",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 17,
                          fontWeight: FontWeight.bold

                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        )
    );
  }
}