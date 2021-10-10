import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/viewmodels/paymentGateway_page_viewmodel.dart';
import 'package:giahdooni/views/SuccessfulShopping_page.dart';
import 'package:giahdooni/views/pay_page.dart';

import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../service_locator.dart';

class PaymentGatewayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentGViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<PaymentGViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 320),
                  child: IconButton(
                    color: Colors.black,
                    iconSize: 33,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.to(() => PayingPage());
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text(
                    'Please fill all of the fields :',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 250),
                  child: Text(
                    'Cart number :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 360,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          width: 2.5,
                          color: Color(0xff8ED362),
                        ),
                      ),
                      hintText: 'Cart Number',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onFieldSubmitted: (value) {
                      model.setCartNum(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 260),
                  child: Text(
                    'Password :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 360,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          width: 2.5,
                          color: Color(0xff8ED362),
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onFieldSubmitted: (value) {
                      model.setPassword(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 300),
                  child: Text(
                    'Cvv2 :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 360,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                          width: 2.5,
                          color: Color(0xff8ED362),
                        ),
                      ),
                      hintText: 'Cvv2',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onFieldSubmitted: (value) {
                      model.setCvv2(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Year :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(
                              width: 2.5,
                              color: Color(0xff8ED362),
                            ),
                          ),
                          hintText: 'year',
                          hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        onFieldSubmitted: (value) {
                          model.setYear(value);
                        },
                      ),
                    ),
                    Text(
                      'Month :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(
                              width: 2.5,
                              color: Color(0xff8ED362),
                            ),
                          ),
                          hintText: 'month',
                          hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        onFieldSubmitted: (value) {
                          model.setMonth(value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  width: 250,
                  height: 55,
                  child: RaisedButton(
                    elevation: 0,
                    color: Color(0xff8ED362),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () async {
                      if (model.cartNum == null ||
                          model.cvv2 == null ||
                          model.password == null ||
                          model.month == null ||
                          model.year == null ||
                          model.cartNum == '' ||
                          model.cvv2 == '' ||
                          model.password == '' ||
                          model.month == '' ||
                          model.year == '') {
                        await showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            message: 'Please fill all the fields!',
                          ),
                        );

                        print(model.cartNum);
                      } else {
                        await Get.to(() => SuccessfulShoppingPAge());
                      }
                    },
                    child: Text(
                      'Pay',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.white,
                          letterSpacing: 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
