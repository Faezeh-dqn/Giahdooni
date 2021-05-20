import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giahdooni/models/user.dart';
import 'package:giahdooni/models/plant.dart';
import 'authentication_service.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final AuthenticationService authenticationService;
  String userCollection = 'users';
  String plantCollection = 'palnts';

  FirestoreService({this.fireStore, this.authenticationService});

  Future createUser(User user) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(user.toMap());
  }

  Future<Plant> getPlantFromDB(String name) async {
    Plant plant;

    QuerySnapshot querySnapshot = await fireStore
        .collection(plantCollection)
        .where('name', isEqualTo: name)
        .get();
    querySnapshot.docs.forEach((snapshot) {
      plant = Plant.fromMap(snapshot.data());
    });

    return plant;
  }
}
