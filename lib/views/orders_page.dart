import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/orders.dart';
import 'package:giahdooni/viewmodels/orders_Page_viewmodel.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'package:stacked/stacked.dart';

import '../service_locator.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersPageViewModel>.reactive(
      viewModelBuilder: () => getIt<OrdersPageViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) => model.getOrderdPlantFromDB(),
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
                      MenuPage(),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.orders.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  '${model.orders[index].plantImage}'),
                              radius: 70,
                            ),
                            Container(
                              height: 160,
                              width: 230,
                              child: Column(
                                children: [
                                  Text(
                                    '${model.orders[index].name}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Vase shape : ${model.orders[index].vaseShape}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Vase color : ${model.orders[index].color}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Vase price : ${model.orders[index].vaseprice} T',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Plant price : ${model.orders[index].plantPrice} T',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Numbers : ${model.orders[index].itemNum}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Total price : ${model.orders[index].totalprice} T',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff8ED362),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                onPressed: () {
                                  model
                                      .setCounting(model.orders[index].itemNum);
                                  print(model.counting);
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.counting.toString(),
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff8ED362),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                onPressed: () {
                                  model.setCounting(
                                      (model.orders[index].itemNum) + 1);
                                  print(model.counting);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {},
                    color: Color(0xff8ED362),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
