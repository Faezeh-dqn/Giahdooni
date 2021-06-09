import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/viewmodels/paying_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../service_locator.dart';

class PayingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PayingPageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<PayingPageViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: model.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text(
                      'Complete your information :',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(
                                width: 2.5,
                                color: Color(0xff8ED362),
                              ),
                            ),
                            hintText: 'name',
                            hintStyle: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          validator: (value) {
                            return model.validateFromField(value, 'name');
                          },
                          onChanged: (value) {
                            model.formKey.currentState.validate();
                            model.setName(value);
                          },
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(
                                  width: 2.5, color: Color(0xff8ED362)),
                            ),
                            hintText: 'last name',
                            hintStyle: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          validator: (value) {
                            return model.validateFromField(value, 'last name');
                          },
                          onChanged: (value) {
                            model.setlastName(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(
                                  width: 2.5, color: Color(0xff8ED362)),
                            ),
                            hintText: 'province',
                            hintStyle: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          validator: (value) {
                            return model.validateFromField(value, 'province');
                          },
                          onChanged: (value) {
                            model.setProvince(value);
                            print(model.province);
                          },
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: new BorderSide(
                                  width: 2.5,
                                  color: Color(0xff8ED362),
                                ),
                              ),
                              hintText: 'city',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w500)),
                          onChanged: (value) {
                            model.setCity(value);
                            print(model.city);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: new BorderSide(
                                    width: 2.5, color: Color(0xff8ED362)),
                              ),
                              hintText: 'post code',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w500)),
                          onChanged: (value) {
                            model.setPostCode(value);
                          },
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: new BorderSide(
                                    width: 2.5, color: Color(0xff8ED362)),
                              ),
                              hintText: 'phone number',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w500)),
                          onChanged: (value) {
                            model.setPhoneNum(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.red,
                      ),
                      Container(
                        width: 360,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: new BorderSide(
                                    width: 2.5, color: Color(0xff8ED362)),
                              ),
                              hintText: 'address',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w500)),
                          onChanged: (value) {
                            model.setAddress(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Checkbox(
                          value: model.isSelected,
                          onChanged: (value) {
                            model.setIsSelected(value);
                          }),
                      Text(
                        'I accept the rules',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                    width: 200,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () async {
                        await model.submitForm();
                        (model.isSelected)
                            ? print('okay')
                            : showTopSnackBar(
                                context,
                                CustomSnackBar.info(
                                  message: 'Please accept the rules!',
                                ),
                              );
                      },
                      color: (model.isSelected)
                          ? Color(0xff8ED362)
                          : Colors.grey.shade500,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
