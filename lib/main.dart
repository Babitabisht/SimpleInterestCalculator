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
  var _currencies = ["Rupees", "Dollars", "Pounds"];
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // Theme.of(context) will navigate to the widget tree and return the nearest theme in the tree, if we have a standalone theme defined just above the widget as an immediate paret then it will just return  the nearest theme else it will return the default theme of our application.

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
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter Principal ammount",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Rate",
                      hintText: "Enter your rate of interest",
                      labelStyle: textStyle,
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
                        style: textStyle,
                        decoration: InputDecoration(
                            labelText: "Rate",
                            hintText: "Enter rate ",
                            labelStyle: textStyle,
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
                      child: Text(
                        "Calculate",
                        textScaleFactor: 1.5,
                      ),
                      textColor: Theme.of(context).primaryColorDark,
                      color: Theme.of(context).accentColor,
                      onPressed: () => {},
                    )),
                    Expanded(
                        child: RaisedButton(
                      textColor: Theme.of(context).primaryColorDark,
                      color: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Reset",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () => {},
                    ))
                  ],
                ),
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
              ),
              Padding(
                padding: EdgeInsets.only(top: minimumPadding),
                child: Text(
                  "data",
                  style: textStyle,
                ),
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
