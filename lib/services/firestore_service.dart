import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giahdooni/models/user.dart';
import 'package:giahdooni/models/plant.dart';
import 'authentication_service.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final AuthenticationService authenticationService;
  String userCollection = 'users';
  String plantCollection = 'plants';

  FirestoreService({this.fireStore, this.authenticationService});

  Future createUser(User user) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .set(user.toMap());
  }

  Future<Plant> getPlantFromDB(String name) async {
    Plant chosenPlant;
    QuerySnapshot querySnapshot =
        await fireStore.collection(plantCollection).where(name).get();
    querySnapshot.docs.forEach((snapShot) {
      Plant plant = Plant.fromMap(snapShot.data());
      chosenPlant = plant;
      return chosenPlant;
    });
  }
}
