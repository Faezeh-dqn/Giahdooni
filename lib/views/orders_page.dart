import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/viewmodels/orders_Page_viewmodel.dart';
import 'package:giahdooni/views/pay_page.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
        builder: (context, model, _) => (model.orders.isEmpty)
            ? Center(
                child: Text(
                  'There is no order yet! :(',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600),
                ),
              )
            : model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Scaffold(
                    body: Center(
                      child: Stack(
                        children: [
                          Column(
                            children: [
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
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '${model.orders[index].name}',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    'Vase shape : ${model.orders[index].vaseShape}',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Vase color : ${model.orders[index].color}',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Vase price : ${model.orders[index].vaseprice} T',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Plant price : ${model.orders[index].plantPrice} T',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Numbers : ${model.orders[index].itemCount}',
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    'Total price : ${model.orders[index].totalprice} T',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff57C611),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffBFFB99),
                                                  shape: BoxShape.circle),
                                              child: (model.orders[index]
                                                          .itemCount ==
                                                      1)
                                                  ? IconButton(
                                                      iconSize: 25,
                                                      onPressed: () async {
                                                        await model
                                                            .deleteFromCart(
                                                                model.orders[
                                                                    index]);

                                                        // ignore: await_only_futures
                                                        await showTopSnackBar(
                                                          context,
                                                          CustomSnackBar
                                                              .success(
                                                            message:
                                                                'Submit was successful!',
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color:
                                                            Colors.red.shade600,
                                                      ),
                                                    )
                                                  : IconButton(
                                                      iconSize: 25,
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            if (model
                                                                    .orders[
                                                                        index]
                                                                    .itemCount >
                                                                1) {
                                                              model
                                                                  .orders[index]
                                                                  .itemCount--;
                                                            }

                                                            model.orders[index]
                                                                .totalprice = (model
                                                                        .orders[
                                                                            index]
                                                                        .plantPrice +
                                                                    model
                                                                        .orders[
                                                                            index]
                                                                        .vaseprice) *
                                                                model
                                                                    .orders[
                                                                        index]
                                                                    .itemCount;
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              model.orders[index].itemCount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffBFFB99),
                                                  shape: BoxShape.circle),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      model.orders[index]
                                                          .itemCount++;

                                                      model.orders[index]
                                                          .totalprice = (model
                                                                  .orders[index]
                                                                  .plantPrice +
                                                              model
                                                                  .orders[index]
                                                                  .vaseprice) *
                                                          model.orders[index]
                                                              .itemCount;
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.grey.shade700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Divider(
                                          thickness: 2,
                                          height: 10,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Color(0xff7BEB34),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 600, left: 90),
                            child: Container(
                              height: 60,
                              width: 200,
                              child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () async {
                                  model.updateOrders(model.orders);

                                  await Get.to(PayingPage());
                                },
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
                  ));
  }
}
