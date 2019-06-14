import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  void handleRadio(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your Weight On Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your Weight On Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your Weight On Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        default:
      }
    });
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Weight On Planet X"),
          centerTitle: true,
        ),
        body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            padding: const EdgeInsets.all(2.5),
            children: <Widget>[
              new Image.asset(
                'images/planet.png',
                height: 133.0,
                width: 200.0,
              ),
              new Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: 'Your Weight On Earth',
                            hintText: 'In Pounds',
                            icon: new Icon(Icons.person_outline)
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                              value: 0,
                              groupValue: radioValue,
                              onChanged: handleRadio,
                              activeColor: Colors.brown),
                          new Text(
                            "Pluto",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 1,
                              groupValue: radioValue,
                              onChanged: handleRadio,
                              activeColor: Colors.redAccent),
                          new Text(
                            "Mars",
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Radio<int>(
                              value: 2,
                              groupValue: radioValue,
                              onChanged: handleRadio,
                              activeColor: Colors.orangeAccent),
                          new Text(
                            "Venus",
                            style: new TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: new Text(
                          _weightController.text.isEmpty ? "Please Enter Weight" : _formattedText + " (lbs)",
                          style: new TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 19.4,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
