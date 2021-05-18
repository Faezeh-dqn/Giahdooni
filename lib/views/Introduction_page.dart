import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:stacked/stacked.dart';

class Intro_p extends StatelessWidget {
  final String imageAssetPath;
  final String name;
  String about;

  Intro_p({
    @required this.imageAssetPath,
    @required this.name,
    @required this.about,
  });
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => getIt<HomePageViewModel>(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 340),
                  child: IconButton(
                    iconSize: 32,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.to(
                        ChoosingPage(
                          about: about,
                          imageName: name,
                          imagePath: imageAssetPath,
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: Text(
                        'About  $name',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Image.asset(
                        '$imageAssetPath',
                        height: 260,
                        width: 260,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 370,
                      height: 335,
                      child: Text(
                        about,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
