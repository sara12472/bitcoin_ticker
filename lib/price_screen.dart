import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  int bitcoinPrice = 0;
  double ethereumPrice = 0;
  double litecoinPrice = 0;

  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItem = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      dropDownItem.add(newItem);
    }
    return DropdownButton<String>(
      items: dropDownItem,
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
        getData();
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItem,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iosPicker();
    } else if (Platform.isAndroid) {
      return androidDropDownButton();
    } else {
      return Text('Unsupported platform');
    }
  }

  void getData() async {
    BitCoinData bitCoinData = BitCoinData();
    var data = await bitCoinData.getCurrrencyData();

    setState(() {
      bitcoinPrice = (data['bitcoin'][selectedCurrency.toLowerCase()] as num)
          .toInt();
      ethereumPrice = (data['ethereum'][selectedCurrency.toLowerCase()] as num)
          .toDouble();
      litecoinPrice = (data['litecoin'][selectedCurrency.toLowerCase()] as num)
          .toDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Coin Ticker')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),

                child: Text(
                  '1 BTC:  $bitcoinPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),

                child: Text(
                  '1 ETH:  $ethereumPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),

                child: Text(
                  '1 LTC:   $litecoinPrice $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0.0, 437.0, 0.0, 0.0),
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.blue,
              child: Platform.isIOS ? iosPicker() : androidDropDownButton(),
            ),
          ),
        ],
      ),
    );
  }
}
