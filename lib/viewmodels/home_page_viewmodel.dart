import 'package:flutter/cupertino.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  List<Plant> plants = [];
  FirestoreService firestoreService;
  HomePageViewModel({@required this.firestoreService});
  Plant plantToShow;

  getPlantFormDB(String name) async {
    setBusy(true);
    plantToShow = await firestoreService.getPlantFromDB(name);
    setBusy(false);
    notifyListeners();
    return plantToShow;
  }

  Plant plant0 = Plant(
      imagePath: 'images/petus.jpg',
      name: 'Pothos',
      price: 50000,
      about:
          'A perfect houseplant for beginners, pothos is one of the easiest you can grow -- and one of the most popular. This hardy indoor plant features dark green leaves splashed and marbled in shades of yellow, cream, or white. Pothos is wonderfully versatile in the home: You can grow it in hanging baskets to trail down, let it climb a totem or trellis, or grow horizontally along a tabletop or mantle. ');
  Plant plant1 = Plant(
      imagePath: 'images/bent.jpg',
      name: 'poinsettia',
      price: 110000,
      about:
          'Native to Mexico, poinsettias are in the Euphorbia family and are a popular holiday plant because of their colorful bracts (leaves). There is also a species that is used as a cut flower. They are most commonly used for decorating during the winter holidays, but are also attractive as green plants throughout the year.');
  Plant plant2 = Plant(
      imagePath: 'images/agloo.jpg',
      name: 'Aglaonema',
      price: 70000,
      about:
          'Commonly called the “Chinese Evergreen”, this plant is native to the tropical forest floors of Asia, and so appreciates a spot where it can receive indirect light as direct sunlight can scorch its leaves. Keeping it a few feet from a well lit window where it can receive bright diffused light is ideal');
  Plant plant3 = Plant(
      imagePath: 'images/anjiri.jpg',
      name: 'Swees Cheese',
      price: 98000,
      about:
          'Monstera deliciosa (monstera) is a climbing vine that can be grown in its natural form on a stake or pole. It is widely available as a popular houseplant at many garden centers and grown as a cluster of multiple vines to create a full shrub-like appearance. Monstera has dark green leathery foliage with deep lobing, capable of growing up to 36” wide.');
  Plant plant4 = Plant(
      imagePath: 'images/radiator.jpg',
      name: 'Radiator',
      price: 34000,
      about:
          'Radiator Plants is the common name used to identify any plants in the Peperomia genus. The Peperomia species is a mat-forming and slow-growing species of evergreen vine. It is one of two genera within the large Piperaceae family. There have been more than 1500 species recorded all throughout tropical and subtropical regions. Most of the varieties are small, compact, epiphytes that usually grow on rotten wood.');
  Plant plant5 = Plant(
      imagePath: 'images/sansoria.jpg',
      name: 'Sansevieria',
      price: 100000,
      about:
          'Sansevierias are succulent plants- they have strong, stiff, almost plastic-like, succulent leaves that erupt right out the ground from the roots or rhizomes. There are no stems or trunks. ... In nature most of the Sansevieria live in hot, dry climates in very well draining soils and most live in bright sunny locations.');
  Plant plant6 = Plant(
      imagePath: 'images/nakhl.jpg',
      name: 'Madagascar palm',
      price: 135000,
      about:
          'Madagascar palm is also known as “Madagascar Palm” to all you non fact memorizing scientists that are out there. Although it resembles both a palm and a cactus it is neither, it is a succulent in the Apocynaceae Family, related to lianas and also closer to home the, “Indian Hemp” plant found in north America traditionally used to make fiber. This plant is one of thousands of species original to only Madagascar, thanks to a huge earthquake 65 million years ago that separated it from India. Which now');
  Plant plant7 = Plant(
      imagePath: 'images/hosnn.jpg',
      name: 'Solenostemon',
      price: 54000,
      about:
          'Solenostemon scutellarioides (coleus) is one of the flowering plant species belongs to family Lamiaceae. It is native to Malaysia and South East Asia. Plants need moist-drained soil to grow and typically grow 0.5-1 m tall, though some may grow as tall as 2 meters. Plants are bushy, woody-based evergreen perennial and mostly grown due to its decorative variegated leaves. It is also known as Coleus blumei and Plectranthus scutellarioides');
  Plant plant8 = Plant(
      imagePath: 'images/zamofilia.jpg',
      name: 'Zamiifolia',
      price: 94000,
      about:
          'The plant commonly known as "ZZ" has become a popular houseplant because of its interesting foliage and adaptability to challenging growing conditions. In fact, ZZ is so impressive that is was named a Florida Plant of the Year by FNGLA (Florida Nursery, Growers & Landscape Association) more than once.The ZZ plant has a bold, tropical look with glossy, green leaflets arranged along upright stems. ZZ plant is technically an aroid and is more closely related to elephant ear, anthurium, and philodendron');

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
