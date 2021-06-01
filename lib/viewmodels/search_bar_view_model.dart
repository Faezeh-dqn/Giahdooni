import 'package:flutter/foundation.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:stacked/stacked.dart';

import 'package:giahdooni/services/firestore_service.dart';

class SearchBarPageViewModel extends BaseViewModel {
  final FirestoreService firestoreService;
  SearchBarPageViewModel({@required this.firestoreService});

  bool hasCalledApi = false;
  bool x = true;
  Plant plantToShow;

  getPlantFormDB(String name) async {
    setBusy(true);
    plantToShow = await firestoreService.getPlantFromDB(name);
    hasCalledApi = true;
    setBusy(false);
    notifyListeners();
  }
}
