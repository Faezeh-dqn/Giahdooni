import 'package:flutter/material.dart';
import 'package:giahdooni/viewmodels/orders_Page_viewmodel.dart';
import 'package:giahdooni/views/menu_page.dart';
import 'package:stacked/stacked.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage(
      {this.name,
      this.itemsNum,
      this.plantPrice,
      this.vaseColor,
      this.vasePrice,
      this.vaseShape,
      this.path,
      this.total});
  String name;
  int plantPrice;
  String vaseShape;
  String vaseColor;
  int itemsNum;
  int vasePrice;
  String path;
  int total;
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersPageViewModel>.reactive(
      viewModelBuilder: () => OrdersPageViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 350, top: 20),
                child: IconButton(
                  iconSize: 32,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                ),
              ),
              Image.asset(
                widget.path,
                height: 150,
                width: 150,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('count :' + widget.itemsNum.toString(),
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
              Text('color :' + widget.vaseColor,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
              Text('shape :' + widget.vaseShape,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
              Text('total price :' + widget.total.toString(),
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
