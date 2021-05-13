import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:giahdooni/views/choosing_page.dart';
import 'package:giahdooni/viewmodels/buying_page_viewmodel.dart';
import 'package:giahdooni/views/orders_page.dart';
import 'package:stacked/stacked.dart';

class BuyingPage extends StatefulWidget {
  BuyingPage({
    @required this.imagePath,
    @required this.imageName,
    @required this.plantPrice,
  });
  String imagePath;
  String imageName;
  int plantPrice;
  int vasePriceForShow;
  bool showVPrice = true;
  Color coloredCircle;
  int totalPrice;
  bool showTotalPrice = true;

  @override
  _BuyingPageState createState() => _BuyingPageState();
}

class _BuyingPageState extends State<BuyingPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyingPageViewModel>.reactive(
      viewModelBuilder: () => BuyingPageViewModel(),
      builder: (context, model, _) => Scaffold(
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
                              imagePath: widget.imagePath,
                              imageName: widget.imageName,
                              plantPrice: widget.plantPrice,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Image.asset(
                    widget.imagePath,
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
                        widget.imageName,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        widget.plantPrice.toString() + 'T',
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
                    }

                    print(model.itemCount);
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
                                itemCount: 1,
                                itemBuilder: (context, itemCount) {
                                  return Column(
                                    children: [
                                      BottomSheetShapes(
                                          shapeName: model.vase1.shape,
                                          onPressed: () {
                                            model.setselectedShape(
                                                model.vase1.shape);
                                            setState(() {
                                              widget.showVPrice = false;
                                              widget.showTotalPrice = false;
                                            });
                                          }),
                                      BottomSheetShapes(
                                          shapeName: model.vase2.shape,
                                          onPressed: () {
                                            model.setselectedShape(
                                                model.vase2.shape);
                                            setState(() {
                                              widget.showVPrice = false;
                                              widget.showTotalPrice = false;
                                            });
                                          }),
                                      BottomSheetShapes(
                                          shapeName: model.vase3.shape,
                                          onPressed: () {
                                            model.setselectedShape(
                                                model.vase3.shape);
                                            setState(() {
                                              widget.showVPrice = false;
                                              widget.showTotalPrice = false;
                                            });
                                          }),
                                      BottomSheetShapes(
                                          shapeName: model.vase4.shape,
                                          onPressed: () {
                                            model.setselectedShape(
                                                model.vase4.shape);
                                            setState(() {
                                              widget.showVPrice = false;
                                              widget.showTotalPrice = false;
                                            });
                                          }),
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
                                itemCount: 1,
                                itemBuilder: (context, itemCount) {
                                  return Column(
                                    children: [
                                      BottomSheetColors(
                                        colorName: model.vaseColor[0],
                                        onPressed: () {
                                          widget.coloredCircle =
                                              Colors.grey.shade100;
                                          model.setselectedColor(
                                              model.vaseColor[0]);
                                          checkShape(model, 0);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[1],
                                        onPressed: () {
                                          widget.coloredCircle = Colors.black;
                                          model.setselectedColor(
                                              model.vaseColor[1]);
                                          checkShape(model, 1);
                                          print(model.selectedColor);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[2],
                                        onPressed: () {
                                          widget.coloredCircle = Colors.brown;
                                          model.setselectedColor(
                                              model.vaseColor[2]);

                                          checkShape(model, 2);
                                          print(model.selectedColor);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[3],
                                        onPressed: () {
                                          widget.coloredCircle =
                                              Colors.yellow.shade600;
                                          model.setselectedColor(
                                              model.vaseColor[3]);
                                          checkShape(model, 3);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[4],
                                        onPressed: () {
                                          widget.coloredCircle = Colors.orange;
                                          model.setselectedColor(
                                              model.vaseColor[4]);
                                          checkShape(model, 4);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[5],
                                        onPressed: () {
                                          widget.coloredCircle =
                                              Colors.blue.shade800;
                                          model.setselectedColor(
                                              model.vaseColor[5]);
                                          checkShape(model, 5);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[6],
                                        onPressed: () {
                                          widget.coloredCircle = Colors.green;
                                          model.setselectedColor(
                                              model.vaseColor[6]);
                                          checkShape(model, 6);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[7],
                                        onPressed: () {
                                          widget.coloredCircle = Colors.red;
                                          model.setselectedColor(
                                              model.vaseColor[7]);
                                          checkShape(model, 7);
                                        },
                                      ),
                                      BottomSheetColors(
                                        colorName: model.vaseColor[8],
                                        onPressed: () {
                                          widget.coloredCircle =
                                              Colors.grey.shade700;
                                          model.setselectedColor(
                                              model.vaseColor[8]);
                                          checkShape(model, 8);
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
                          model.selectedColor,
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
                            color: widget.coloredCircle,
                            shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              (widget.showVPrice)
                  ? Container(
                      height: 10,
                    )
                  : showVasePrice(model),
              SizedBox(
                height: 20,
              ),
              (widget.showTotalPrice)
                  ? Container(
                      height: 10,
                    )
                  : showTotalPrice(model),
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
                  onPressed: () {
                    Get.to(
                      () => OrdersPage(
                        vasePrice: widget.vasePriceForShow,
                        vaseColor: model.selectedColor,
                        name: widget.imageName,
                        itemsNum: model.itemCount,
                        plantPrice: widget.plantPrice,
                        vaseShape: model.selectedShape,
                        path: widget.imagePath,
                        total: widget.totalPrice,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkShape(BuyingPageViewModel model, int i) {
    if (model.selectedShape == 'Cylindrical') {
      model.vase1.color = model.vaseColor[i];
    } else if (model.selectedShape == 'Spheral') {
      model.vase1.color = model.vaseColor[i];
    } else if (model.selectedShape == 'Cubical') {
      model.vase1.color = model.vaseColor[i];
    } else {
      model.vase1.color = model.vaseColor[i];
    }
  }

  Widget showVasePrice(BuyingPageViewModel model) {
    if (model.selectedShape == 'Cylindrical') {
      widget.vasePriceForShow = model.vase1.price;
    } else if (model.selectedShape == 'Spheral') {
      widget.vasePriceForShow = model.vase2.price;
    } else if (model.selectedShape == 'Cubical') {
      widget.vasePriceForShow = model.vase3.price;
    } else if (model.selectedShape == 'Conical') {
      widget.vasePriceForShow = model.vase4.price;
    }
    return Text(
      'vase price : ' + widget.vasePriceForShow.toString() + 'T',
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade800),
    );
  }

  Widget showTotalPrice(BuyingPageViewModel model) {
    if (model.selectedShape == 'Cylindrical') {
      widget.totalPrice =
          (model.vase1.price + widget.plantPrice) * model.itemCount;
    } else if (model.selectedShape == 'Spheral') {
      widget.totalPrice =
          (model.vase2.price + widget.plantPrice) * model.itemCount;
    } else if (model.selectedShape == 'Cubical') {
      widget.totalPrice =
          (model.vase3.price + widget.plantPrice) * model.itemCount;
    } else if (model.selectedShape == 'Conical') {
      widget.totalPrice =
          (model.vase4.price + widget.plantPrice) * model.itemCount;
    }
    return Text(
      'total price : ' + widget.totalPrice.toString() + 'T',
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
  static int countItem = 0;
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
                )))
      ],
    );
  }
}
