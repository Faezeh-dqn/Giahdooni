import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giahdooni/models/user.dart';
import 'package:giahdooni/viewmodels/profile_page_viewmodel.dart';
import 'package:giahdooni/views/home_page.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../service_locator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilePageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<ProfilePageViewModel>(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: model.retrivedUser == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ClipOval(
                        child: SizedBox(
                            width: 200,
                            height: 200,
                            child: model.imagePath == ''
                                ? Image.asset('images/no_pic.png')
                                : Image.network(model.imagePath)),
                      ),
                      TextButton(
                        onPressed: () {
                          model.uploadPic();
                        },
                        child: Text(
                          'Click to choose profile photo',
                          style: TextStyle(color: Color(0xff57B71B)),
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
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'First name : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 255,
                                child: TextField(
                                  controller: TextEditingController(
                                      text: model.firstName),
                                  onChanged: (value) {
                                    model.firstName = value;
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                    ),
                                    hintText: 'first name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Last name : ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 255,
                                child: TextField(
                                  controller: TextEditingController(
                                      text: model.lastName),
                                  onChanged: (value) {
                                    model.lastName = value;
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                    ),
                                    hintText: 'last name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Email : ',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 33),
                                child: Container(
                                  width: 255,
                                  child: TextField(
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                    enabled: false,
                                    enableInteractiveSelection: false,
                                    controller: TextEditingController(
                                        text: model.email),
                                    onChanged: (value) {
                                      model.email = value;
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.black),
                                      ),
                                      hintText: 'email',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 55,
                            width: 250,
                            child: RaisedButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () async {
                                if (model.firstName != '' &&
                                    model.lastName != '' &&
                                    model.email != '') {
                                  await model.updateUser();
                                  // ignore: await_only_futures
                                  await showTopSnackBar(
                                    context,
                                    CustomSnackBar.success(
                                      message: 'Submit was successful!',
                                    ),
                                  );
                                } else {
                                  showTopSnackBar(
                                    context,
                                    CustomSnackBar.error(
                                      message: 'Please fill all items!',
                                    ),
                                  );
                                }
                                await Get.to(MenuPage());
                              },
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
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
