import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(title: "Simple Interest Calculator", home: SIForm()));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currencies = ["Rupees", "Dollars", "Pounds"];
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Simple Interest Calculator"),
        ),
        body: Container(
          margin: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              getAssetImage(),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter Principal ammount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Rate",
                      hintText: "Enter your rate of interest",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Rate",
                            hintText: "Enter rate ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(width: minimumPadding * 5),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _currencies.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        value: "Rupees",
                        onChanged: (String value) {},
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
              ),
              Padding(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      child: Text("Calculate"),
                      onPressed: () => {},
                    )),
                    Expanded(
                        child: RaisedButton(
                      child: Text("Reset"),
                      onPressed: () => {},
                    ))
                  ],
                ),
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
              ),
              Padding(
                padding: EdgeInsets.only(top: minimumPadding),
                child: Text("data"),
              )
            ],
          ),
        ));
  }

  Widget getAssetImage() {
    AssetImage assetImage = AssetImage("images/money.jpg");
    Image img = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: img,
      margin: EdgeInsets.all(minimumPadding * 5),
    );
  }
}
