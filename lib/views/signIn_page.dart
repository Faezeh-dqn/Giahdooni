import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/sign_in_viewmodel.dart';
import 'package:giahdooni/views/signup_page.dart';
import 'package:stacked/stacked.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => getIt<SignInViewModel>(),
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
                              Get.offAll(SignUpPage());
                            },
                            color: Color(0xff4A6934),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 90, top: 2),
                            child: RaisedButton(
                              elevation: 0,
                              onPressed: () {
                                print('ok');
                              },
                              color: Color(0xff4A6934),
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 33),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        height: 10,
                        indent: 230,
                        endIndent: 35,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 130,
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
                height: 60,
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
                padding: EdgeInsets.only(top: 110),
                child: Container(
                  height: 60,
                  width: 200,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      model.signIn();
                    },
                    color: Color(0xff4A6934),
                    child: Text(
                      'Sign in',
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
