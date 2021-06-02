import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:giahdooni/models/user.dart';
import 'package:giahdooni/services/authentication_service.dart';
import 'package:giahdooni/services/firebase_storage_service.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageViewModel extends BaseViewModel {
  FirebaseStorageService firebaseStorageService;
  AuthenticationService authenticationService;
  FirestoreService firestoreService;
  ProfilePageViewModel(
      {@required this.firebaseStorageService,
      @required this.firestoreService,
      @required this.authenticationService});
  File _image;
  User retrivedUser;
  String firstName;
  String lastName;
  String email;
  User updatedUser;
  uploadPic() async {
    _image = await firebaseStorageService.uploadPic();

    print('done!');
  }

  Future retriveUser() async {
    retrivedUser = await firestoreService.retriveUser();
  }

  Future updateUser(
      User user, String name, String lastname, String email) async {
    updatedUser =
        await firestoreService.updateUser(user, name, lastname, email);
  }

  setTotalPrice(File image) {
    _image = image;
    notifyListeners();
  }

  File get image => _image;
}
