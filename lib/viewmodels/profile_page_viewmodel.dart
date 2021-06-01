import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

import 'package:image_picker/image_picker.dart';

class ProfilePageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  ProfilePageViewModel({@required this.firestoreService});
  File _imagee;
  Future getImage() async {
    PickedFile image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    _imagee = File(image.path);
    notifyListeners();
  }
}
