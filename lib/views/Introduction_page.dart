import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:stacked/stacked.dart';

class Intro_p extends StatelessWidget {
  Plant plant;

  Intro_p({@required this.plant});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => getIt<HomePageViewModel>(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 340),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.to(
                      ChoosingPage(
                        plant: plant,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 250),
                child: Text(
                  'About :',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                thickness: 2,
                height: 10,
                indent: 10,
                endIndent: 10,
                color: Color(0xff4A6934),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('${plant.imagePath}'),
                    radius: 105,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    plant.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 370,
                    height: 335,
                    child: SingleChildScrollView(
                      child: Text(
                        '${plant.about}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
