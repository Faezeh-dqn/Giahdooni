import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FirebaseStorageService {
  final FirebaseStorage firebaseStorage;
  FirebaseStorageService({@required this.firebaseStorage});

  uploadPic() async {
    File _image;
    TaskSnapshot taskSnapshot;

    var image = (await ImagePicker().getImage(source: ImageSource.gallery));

    _image = File(image.path);

    if (_image != null) {
      String fileName = basename(_image.path);

      UploadTask uploadTask =
          firebaseStorage.ref().child(fileName).putFile(_image);
      taskSnapshot = await uploadTask.whenComplete(
        () => print('t'),
      );
    } else {
      print('No path recieved');
    }
    if (taskSnapshot != null) {
      print('nice');
    }
    return _image;
  }
}
