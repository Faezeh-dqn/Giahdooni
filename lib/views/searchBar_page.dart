import 'package:flutter/material.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:stacked/stacked.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:get/get.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
  Plant plant;
  SearchBarPage({@required this.plant});
}

class _SearchBarPageState extends State<SearchBarPage> {
  Plant searchedPlant;
  bool isLoading = false;
  isLoadingOrNot() {
    var widgetToShow;
    if (searchedPlant == null) {
      print('we enter here');
      widgetToShow = Padding(
        padding: EdgeInsets.only(top: 60),
        child: CircularProgressIndicator(),
      );
    }
    return widgetToShow;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => getIt<HomePageViewModel>(),
      disposeViewModel: false,
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                  autofocus: true,
                  showCursor: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '  Search...',
                    hintStyle: TextStyle(fontSize: 18, wordSpacing: 0.9),
                  ),
                  onSubmitted: (value) async {
                    isLoading = !isLoading;
                    searchedPlant = await model.getPlantFormDB(value);
                    print(isLoading);
                  }),
              (isLoading == false) ? isLoadingOrNot() : showSearchedPlant()
            ],
          ),
        ),
      ),
    );
  }

  Row showSearchedPlant() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(
              ChoosingPage(
                plant: searchedPlant,
              ),
            );
          },
          icon: Image.asset(searchedPlant.imagePath),
          iconSize: 190,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          searchedPlant.name,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
