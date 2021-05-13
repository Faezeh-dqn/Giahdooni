import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  List<Plant> plants = [];
  FirestoreService firestoreService;
  Plant plantToShow;

  getPlantFormDB(String name) async {
    setBusy(true);
    plantToShow = await firestoreService.getPlantFromDB(name);
    setBusy(false);
    notifyListeners();
  }

  Plant plant0 =
      Plant(imagePath: 'images/petus.jpg', name: 'Pothos', price: 50000);
  Plant plant1 =
      Plant(imagePath: 'images/bent.jpg', name: 'poinsettia', price: 110000);
  Plant plant2 =
      Plant(imagePath: 'images/agloo.jpg', name: 'Aglaonema', price: 70000);
  Plant plant3 =
      Plant(imagePath: 'images/anjiri.jpg', name: 'Swees Cheese', price: 98000);
  Plant plant4 =
      Plant(imagePath: 'images/radiator.jpg', name: 'Radiator', price: 34000);
  Plant plant5 = Plant(
      imagePath: 'images/sansoria.jpg', name: 'Sansevieria', price: 100000);
  Plant plant6 = Plant(
      imagePath: 'images/nakhl.jpg', name: 'Madagascar palm', price: 135000);
  Plant plant7 =
      Plant(imagePath: 'images/hosnn.jpg', name: 'Solenostemon', price: 54000);
  Plant plant8 = Plant(
      imagePath: 'images/zamofilia.jpg', name: 'Zamiifolia', price: 94000);

  init() {
    plants.add(plant0);
    plants.add(plant1);
    plants.add(plant2);
    plants.add(plant3);
    plants.add(plant4);
    plants.add(plant5);
    plants.add(plant6);
    plants.add(plant7);
    plants.add(plant8);
  }
}
