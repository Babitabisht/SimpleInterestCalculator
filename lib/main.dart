import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: SIForm(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ["Rupees", "Dollars", "Pounds"];
  final minimumPadding = 5.0;
  var _currentItemSelected = "";
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var _output = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // Theme.of(context) will navigate to the widget tree and return the nearest theme in the tree, if we have a standalone theme defined just above the widget as an immediate paret then it will just return  the nearest theme else it will return the default theme of our application.

    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Simple Interest Calculator"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(minimumPadding * 2),
            child: ListView(
              children: <Widget>[
                getAssetImage(),
                Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    controller: principalController,
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter any value";
                      } else if (num.tryParse(value) == null) {
                        return "Expected a numeric value";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Principal",
                        hintText: "Enter Principal ammount",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent, fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    controller: roiController,
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter any value";
                      } else if (num.tryParse(value) == null) {
                        return "Expected a numeric value";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Rate",
                        hintText: "Enter your rate of interest",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent, fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: termController,
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please enter any value";
                            } else if (num.tryParse(value) == null) {
                              return "Expected a numeric value";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Term",
                              hintText: "Enter Term ",
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.yellowAccent, fontSize: 15.0),
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
                          value: _currentItemSelected,
                          onChanged: (String value) {
                            setDropDownItem(value);
                          },
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
                        child: Text(
                          "Calculate",
                          textScaleFactor: 1.5,
                        ),
                        textColor: Theme.of(context).primaryColorDark,
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this._output = _calculateTotalReturns();
                            }
                          });
                        },
                      )),
                      Expanded(
                          child: RaisedButton(
                        textColor: Theme.of(context).primaryColorDark,
                        color: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Reset",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          _clear();
                        },
                      ))
                    ],
                  ),
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                ),
                Padding(
                  padding: EdgeInsets.only(top: minimumPadding),
                  child: Text(
                    _output,
                    style: textStyle,
                  ),
                )
              ],
            ),
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

  setDropDownItem(String value) {
    setState(() {
      this._currentItemSelected = value;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * roi * term) / 100;
    return "Total investment is  $_currentItemSelected $totalAmount in  $term  years";
  }

  _clear() {
    this._currentItemSelected = _currencies[0];
    this._output = "";
    this.principalController.text = "";
    this.roiController.text = "";
    this.termController.text = "";
  }
}
