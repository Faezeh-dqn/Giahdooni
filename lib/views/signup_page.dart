import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/sign_up_viewmodel.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:giahdooni/views/signIn_page.dart';
import 'package:stacked/stacked.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => getIt<SignUpViewModel>(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff4A6934),
                child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RaisedButton(
                            elevation: 0,
                            onPressed: () {
                              print('ok');
                            },
                            color: Color(0xff4A6934),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 90, top: 2),
                            child: RaisedButton(
                              elevation: 0,
                              onPressed: () {
                                Get.offAll(SignInPage());
                              },
                              color: Color(0xff4A6934),
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 33),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        height: 10,
                        indent: 10,
                        endIndent: 250,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => model.setFirstName(value),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => model.setLastName(value),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => model.setEmail(value),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 380,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => model.setPassword(value),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  height: 60,
                  width: 200,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      model.signUp();
                    },
                    color: Color(0xff4A6934),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
