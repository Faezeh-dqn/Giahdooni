import 'package:flutter/material.dart';
import 'package:giahdooni/viewmodels/successful_page_viewmodel.dart';
import 'package:giahdooni/views/lastPage.dart';
import 'package:stacked/stacked.dart';

import '../service_locator.dart';

class SuccessfulShoppingPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LastPage()));
      Future.delayed(Duration(seconds: 4)).then((value) => {});
    });
    return ViewModelBuilder<successfulPaymentViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => getIt<successfulPaymentViewModel>(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Image(
                width: 73,
                height: 73,
                image: AssetImage("images/sending.gif"),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Please wait...',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
