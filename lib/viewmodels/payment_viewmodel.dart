import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/AdminPaymentModel.dart';
import '../repositories/paymentRepository.dart';

class PaymentViewModel with ChangeNotifier {
  PaymentRepository _paymentRepository = PaymentRepository();
  Stream<QuerySnapshot<AdminPaymentModel>>? _payment;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<AdminPaymentModel>>? get payment => _payment;

  Future<void> getPayment() async {
    var response = _paymentRepository.getPayment();
    _payment = response;
    notifyListeners();
  }

  Future<void> deletePayment(String id) async {
    await _paymentRepository.deletePayment(id);
    notifyListeners();
  }
}
