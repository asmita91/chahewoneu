
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/event_model.dart';

import '../repositories/event_repository.dart';


class EventViewModel with ChangeNotifier{
  EventRepository _eventRepository =EventRepository();

  Stream<QuerySnapshot<EventModel>>? _event;
  Stream<QuerySnapshot<EventModel>>? get event => _event;

  Future<void> getEvent()
  async{
    var response = _eventRepository.getData();
    _event = response;

    notifyListeners();
  }
}