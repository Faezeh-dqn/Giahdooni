import 'package:flutter/material.dart';
import 'package:giahdooni/viewmodels/profile_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../service_locator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilePageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<ProfilePageViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/petus.jpg'),
                radius: 105,
              ),
              IconButton(
                onPressed: () {
                  model.getImage();
                },
                iconSize: 40,
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1.5,
                height: 10,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              InfoTextField(
                hintText: 'First name',
                infoName: 'First name :',
                left: 0,
              ),
              SizedBox(
                height: 10,
              ),
              InfoTextField(
                hintText: 'Last name',
                infoName: 'Last name :',
                left: 0,
              ),
              SizedBox(
                height: 10,
              ),
              InfoTextField(
                hintText: 'Email',
                infoName: 'Email :',
                left: 33,
              ),
              SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {},
                      color: Color(0xff8ED362),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {},
                      color: Color(0xff8ED362),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTextField extends StatelessWidget {
  String infoName;
  String hintText;
  double left;
  InfoTextField({@required this.hintText, @required this.infoName, this.left});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Text(
          infoName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: left),
          child: Container(
            width: 255,
            child: TextField(
              controller: TextEditingController(text: 'Ahmad'),
              onChanged: (value) {},
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.black),
                ),
                hintText: hintText,
              ),
            ),
          ),
        )
      ],
    );
  }
}
