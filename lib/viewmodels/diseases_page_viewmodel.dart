import 'package:flutter/cupertino.dart';
import 'package:giahdooni/models/diseases.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class DiseasesPageViewModel extends BaseViewModel {
  List<Diseases> diseases = [];
  FirestoreService firestoreService;
  DiseasesPageViewModel({@required this.firestoreService});

  getDiseasesFromDB(String id) async {
    setBusy(true);
    diseases = await firestoreService.getDiseasesFromDB(id);

    setBusy(false);
    notifyListeners();

    print('diseases is : $diseases');
    return diseases;
  }
}
