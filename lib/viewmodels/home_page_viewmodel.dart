import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  HomePageViewModel({@required this.firestoreService});
  Plant plantToShow;
  List<Plant> plantsToSuggest = [];
  String errorToSearch;
  getPlantFormDB(String name) async {
    setBusy(true);

    plantToShow = await firestoreService.getPlantFromDB(name);

    setBusy(false);
    notifyListeners();
    return plantToShow;
  }

  getPlantFromDBToSuggest(int id) async {
    setBusy(true);
    plantsToSuggest = await firestoreService.getPlantFromDBToSuggest(id);
    setBusy(false);
    notifyListeners();

    return plantsToSuggest;
  }
}
