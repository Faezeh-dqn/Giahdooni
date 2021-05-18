import 'package:flutter/material.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:giahdooni/models/plant.dart';

class SearchBarPage extends StatefulWidget {
  @override
  String val;
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
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
                onChanged: (value) {
                  model.getPlantFormDB("Bonsai");
                  print('hhh');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
