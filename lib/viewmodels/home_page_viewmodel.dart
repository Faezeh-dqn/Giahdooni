import 'package:giahdooni/models/plant.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  List<Plant> plants = [];

  Plant plant = Plant(imagePath: 'images/petuus.jpg', name: 'Petus');
  Plant plant1 = Plant(imagePath: 'images/nakhl.jpg ', name: 'Nakhl');

  init() {
    plants.add(plant);
    plants.add(plant1);
  }
}
