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
  ProfilePageViewModel({
    @required this.firebaseStorageService,
    @required this.firestoreService,
    @required this.authenticationService,
  });
  User retrivedUser;
  String imagePath;
  String firstName;
  String lastName;
  String email;

  uploadPic() async {
    File imageFile;
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      String result = await firebaseStorageService.uploadPic(imageFile);
      if (result != null) {
        imagePath = result;
        User updatedUSeresheha = retrivedUser.copyWith(
          image: imagePath,
        );
        await firestoreService.updateUser(updatedUSeresheha);
      }
    }
    notifyListeners();
  }

  Future init() async {
    retrivedUser = await firestoreService.retriveUser();
    imagePath = retrivedUser.image;
    firstName = retrivedUser.firstName;
    lastName = retrivedUser.lastName;
    email = retrivedUser.email;
    notifyListeners();
  }

  Future updateUser() async {
    User user = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: imagePath,
    );
    await firestoreService.updateUser(user);
  }
}
