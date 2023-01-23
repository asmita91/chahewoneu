import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/People_Model.dart';
import '../repositories/People_repo.dart';

class PeopleViewModel with ChangeNotifier {
  PeopleRepository _peopleRepository = PeopleRepository();
  Stream<QuerySnapshot<PeopleModel>>? _people;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<PeopleModel>>? get people => _people;

  Future<void> getPeople() async {
    var response = _peopleRepository.getData();
    _people = response;
    notifyListeners();
  }

  Future<void> deletePeople(String id) async {
    await _peopleRepository.deletePeople(id);
    notifyListeners();
  }
}
