import 'package:giahdooni/models/vase.dart';
import 'package:stacked/stacked.dart';

class BuyingPageViewModel extends BaseViewModel {
  List<String> vaseColor = [
    'White',
    'Black',
    'Brown',
    'Yellow',
    'Orange',
    'Blue',
    'Green',
    'Red',
    'Grey'
  ];
  Vase vase1 = Vase(price: 30000, shape: 'Cylindrical');
  Vase vase2 = Vase(price: 25000, shape: 'Spheral');
  Vase vase3 = Vase(price: 40000, shape: 'Cubical');
  Vase vase4 = Vase(price: 35000, shape: 'Conical');

  String _selectedColor = 'Choose color:';
  String _selectedShape = 'Choose shape:';
  int _itemCount = 0;

  setselectedColor(String selectedColor) {
    _selectedColor = selectedColor;
    notifyListeners();
  }

  String get selectedColor => _selectedColor;

  setItemCount(int itemCount) {
    _itemCount = itemCount;
    notifyListeners();
  }

  int get itemCount => _itemCount;

  setselectedShape(String selectedShape) {
    _selectedShape = selectedShape;
    notifyListeners();
  }

  String get selectedShape => _selectedShape;
}
