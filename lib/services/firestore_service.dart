import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giahdooni/models/user.dart';

import 'authentication_service.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final AuthenticationService authenticationService;
  String userCollection = 'users';

  FirestoreService({this.fireStore, this.authenticationService});

  Future createUser(User user) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(user.toMap());
  }
}
