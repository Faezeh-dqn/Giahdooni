import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/diseases.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/views/diseases_page.dart';

class AboutDiseasesPage extends StatelessWidget {
  @override
  Diseases diseases;
  Plant plant;
  AboutDiseasesPage({@required this.diseases, @required this.plant});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 340),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.to(
                      DiseasesPage(
                        plant: plant,
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Image.asset(
                  diseases.imagepath,
                  height: 280,
                  width: 280,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                diseases.disease,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                      height: 10,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff4A6934),
                    ),
                    Text(
                      'Cause :',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      diseases.cause,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      thickness: 2,
                      height: 10,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff4A6934),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Symptoms :',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        diseases.symptoms,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      height: 10,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff4A6934),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Management :',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        diseases.management,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
