import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/orders.dart';
import 'package:giahdooni/models/plant.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:giahdooni/viewmodels/buying_page_viewmodel.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../service_locator.dart';

class BuyingPage extends StatelessWidget {
  BuyingPage({@required this.plant});
  @override
  bool showVPrice = true;
  bool showTotalPrice = true;
  Color coloredCircle;
  Plant plant;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyingPageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<BuyingPageViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 350, top: 20),
                    child: IconButton(
                      iconSize: 32,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChoosingPage(
                              plant: plant,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Image.asset(
                    plant.imagePath,
                    height: 290,
                    width: 290,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        plant.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        plant.plantPrice.toString() + 'T',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: EdgeInsets.only(left: 120),
                child: CountButton(
                  onPressed1: () {
                    if (model.itemCount > 0) {
                      model.setItemCount(model.itemCount - 1);
                      print(model.itemCount);
                    }
                  },
                  onPressed2: () {
                    model.setItemCount(model.itemCount + 1);
                    print(model.itemCount);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 45,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff8ED362))),
                child: FloatingActionButton(
                  heroTag: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (context) => Container(
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                              color: Color(0xff8ED362),
                              height: 55,
                              width: 400,
                              child: TextButton(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 300),
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: model.vases.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      BottomSheetShapes(
                                        shapeName: model.vases[index].shape,
                                        onPressed: () {
                                          model.setselectedShape(
                                              model.vases[index].shape);

                                          showVPrice = false;
                                          showTotalPrice = false;
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      model.selectedShape,
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 18,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff8ED362))),
                child: FloatingActionButton(
                  heroTag: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (context) => Container(
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                              color: Color(0xff8ED362),
                              height: 55,
                              width: 400,
                              child: TextButton(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 300),
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: model.vaseColor.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      BottomSheetColors(
                                        colorName: model.vaseColor[index],
                                        onPressed: () {
                                          coloredCircle =
                                              model.circledColor[index];
                                          model.setselectedColor(
                                              model.vaseColor[index]);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 200),
                        child: Text(
                          model.selectedColor.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 18,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: coloredCircle, shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              (showVPrice)
                  ? Container(
                      height: 10,
                    )
                  : showVasePrice(model),
              SizedBox(
                height: 20,
              ),
              (showTotalPrice)
                  ? Container(
                      height: 10,
                    )
                  : showTotalPricee(model),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 200,
                child: RaisedButton(
                  elevation: 0,
                  color: Color(0xff8ED362),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text('Buy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w600)),
                  onPressed: () async {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    Order orderdPlant = Order(
                        id: id,
                        color: model.selectedColor,
                        plantPrice: plant.plantPrice,
                        vaseShape: model.selectedShape,
                        name: plant.name,
                        plantImage: plant.imagePath,
                        itemCount: model.itemCount,
                        totalprice: model.totalPrice,
                        vaseprice: model.vasePriceForShow);
                    await model.addOrderedPlantToDB(orderdPlant);

                    // ignore: await_only_futures
                    await showTopSnackBar(
                      context,
                      CustomSnackBar.success(
                        message: 'Submit was successful!',
                      ),
                    );
                    await Get.to(MenuPage());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showVasePrice(BuyingPageViewModel model) {
    if (model.selectedShape == 'Cylindrical') {
      model.setVasePrice(model.vases[0].price);
    } else if (model.selectedShape == 'Spheral') {
      model.setVasePrice(model.vases[1].price);
    } else if (model.selectedShape == 'Cubical') {
      model.setVasePrice(model.vases[2].price);
    } else if (model.selectedShape == 'Conical') {
      model.setVasePrice(model.vases[3].price);
    }
    return Text(
      'vase price : ' + model.vasePriceForShow.toString() + 'T',
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade800),
    );
  }

  Widget showTotalPricee(BuyingPageViewModel model) {
    if (model.selectedShape == 'Cylindrical') {
      model.setTotalPrice(
          (model.vases[0].price + plant.plantPrice) * model.itemCount);
    } else if (model.selectedShape == 'Spheral') {
      model.setTotalPrice(
          (model.vases[1].price + plant.plantPrice) * model.itemCount);
    } else if (model.selectedShape == 'Cubical') {
      model.setTotalPrice(
          (model.vases[2].price + plant.plantPrice) * model.itemCount);
    } else if (model.selectedShape == 'Conical') {
      model.setTotalPrice(
          (model.vases[3].price + plant.plantPrice) * model.itemCount);
    }
    return Text(
      'total price : ' + model.totalPrice.toString() + 'T',
      style: TextStyle(
          fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class BottomSheetShapes extends StatelessWidget {
  BottomSheetShapes({@required this.shapeName, @required this.onPressed});
  final String shapeName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          child: GestureDetector(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                '$shapeName',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        )
      ],
    );
  }
}

class BottomSheetColors extends StatelessWidget {
  BottomSheetColors({@required this.colorName, @required this.onPressed});
  final String colorName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          child: GestureDetector(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                '$colorName',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        )
      ],
    );
  }
}

class CountButton extends ViewModelWidget<BuyingPageViewModel> {
  CountButton({@required this.onPressed1, @required this.onPressed2});
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  @override
  Widget build(BuildContext context, BuyingPageViewModel model) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(color: Color(0xff8ED362), shape: BoxShape.circle),
          child: Center(
              child: IconButton(
            onPressed: onPressed1,
            icon: Icon(Icons.remove),
            color: Colors.white,
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          model.itemCount.toString(),
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(color: Color(0xff8ED362), shape: BoxShape.circle),
          child: IconButton(
            onPressed: onPressed2,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
