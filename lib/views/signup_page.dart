import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/service_locator.dart';
import 'package:giahdooni/viewmodels/sign_up_viewmodel.dart';
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
              SizedBox(
                height: 35,
              ),
              TextButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: 180),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 50),
                  ),
                ),
              ),
              Divider(
                thickness: 3,
                height: 10,
                indent: 10,
                endIndent: 10,
                color: Color(0xff7BEB34),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Color(0xff8ED362)),
                    ),
                    hintText: 'First name',
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Color(0xff8ED362)),
                    ),
                    hintText: 'Last name',
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Color(0xff8ED362)),
                    ),
                    hintText: 'Email',
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Color(0xff8ED362)),
                    ),
                    hintText: 'Password',
                  ),
                  onChanged: (value) => model.setPassword(value),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                child: Row(
                  children: [
                    SizedBox(
                      width: 95,
                    ),
                    Text(
                      'have an account? ',
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                    Text(
                      'Sign In ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.to(SignInPage());
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  height: 60,
                  width: 200,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      model.signUp();
                    },
                    color: Color(0xff8ED362),
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
