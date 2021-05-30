import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giahdooni/models/diseases.dart';
import 'package:giahdooni/models/user.dart';
import 'package:giahdooni/models/plant.dart';
import 'authentication_service.dart';
import 'package:giahdooni/models/orders.dart';

class FirestoreService {
  final FirebaseFirestore fireStore;
  final AuthenticationService authenticationService;
  String userCollection = 'users';
  String plantCollection = 'palnts';
  String orderCollection = 'order';
  String diseasesCollection = 'diseases';

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
      if (plant == null) {
        throw Exception('plant not found');
      }
    });

    return plant;
  }

  Future addOrderedPlantToDB(Order order) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;

    DocumentSnapshot documentSnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(orderCollection)
        .doc(order.name)
        .get();

    if (documentSnapshot.exists) {
      Order retriveDocument = Order.fromMap(documentSnapshot.data());
      Order updatedDocument = order.copyWith(
          itemNum: retriveDocument.itemNum + order.itemNum,
          totalprice: (retriveDocument.plantPrice + order.plantPrice) +
              (retriveDocument.vaseprice + order.vaseprice));

      await fireStore
          .collection(userCollection)
          .doc(currentUserId)
          .collection(orderCollection)
          .doc(order.name)
          .set(updatedDocument.toMap());
    } else {
      await fireStore
          .collection(userCollection)
          .doc(currentUserId)
          .collection(orderCollection)
          .doc(order.name)
          .set(order.toMap());
    }
  }

  Future<List<Plant>> getPlantFromDBToSuggest(int id) async {
    List<Plant> plantsToSuggest = [];
    QuerySnapshot querySnapshot = await fireStore
        .collection(plantCollection)
        .where('suggestionID', isEqualTo: id)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      Plant plant = Plant.fromMap(snapshot.data());
      plantsToSuggest.add(plant);
    });

    return plantsToSuggest;
  }

  Future<List<Diseases>> getDiseasesFromDB(String id) async {
    List<Diseases> diseases = [];
    QuerySnapshot querySnapshot = await fireStore
        .collection(plantCollection)
        .doc(id)
        .collection(diseasesCollection)
        .get();

    print('id is :   $id');
    print('disease from DBs is :  ${querySnapshot.docs}');
    querySnapshot.docs.forEach((snapshot) {
      Diseases disease = Diseases.fromMap(snapshot.data());
      diseases.add(disease);
    });

    return diseases;
  }

  Future<List<Order>> getOrderdPlantFromDB() async {
    List<Order> orders = [];
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    QuerySnapshot querySnapshot = await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(orderCollection)
        .get();

    querySnapshot.docs.forEach((snapshot) {
      Order product = Order.fromMap(snapshot.data());
      orders.add(product);
    });
    return orders;
  }

  deleteOrderedPlantFromDB(Order order) async {
    String currentUserId = authenticationService.firebaseAuth.currentUser.uid;
    await fireStore
        .collection(userCollection)
        .doc(currentUserId)
        .collection(orderCollection)
        .doc(order.name)
        .delete();
  }
}
