import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

const url1 =
    'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=85E9829B-B560-484E-8D1D-617176729B2E';
const apiKey = '85E9829B-B560-484E-8D1D-617176729B2E';
const apiUrl = 'https://rest.coinapi.io/v1/exchangerate/ ';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[1];
  String toCoin = 'EUR';
  String fromCoin = 'BTC';
  String actualRate;
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  void getData() async {
    isWaiting = true;
    try {
      String data = await CoinData().getCoinData(fromCoin, toCoin);
      isWaiting = false;
      setState(() {
        actualRate = data;
      });
    } catch (e) {
      print(e);
    }
  }

  //  para insertar la lista en el DropdownItem (selector de monedas)
  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      hint: Text(selectedCurrency),
      items: dropdownItems,
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue;
          toCoin = newValue;
          getData();
        });
      },
    );
  }

// para insertar la lista en el cupertirno Piker (selector de monedas)

  CupertinoPicker iOSPicker() {
    List<Widget> pikerItems = [];
    for (String currency in currenciesList) {
      pikerItems.add(Text(currency, style: TextStyle(color: Colors.white)));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
          setState(() {
            toCoin = selectedIndex as String;
            getData();
          });
        },
        children: pikerItems);
  }

  // se determina si se usa un iOS / Android
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdownButton();
    }
  }

  String getCriptoCoin(int orden) {
    fromCoin = cryptoList[orden].toString();
    return fromCoin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(
            cryptoCurrency: fromCoin = getCriptoCoin(0),
            value: isWaiting ? '?' : actualRate,
            selectedCurrency: toCoin,
          ),
          CryptoCard(
            cryptoCurrency: fromCoin = getCriptoCoin(1),
            value: isWaiting ? '?' : coinValues[getCriptoCoin(2).toString()],
            selectedCurrency: toCoin,
          ),
          CryptoCard(
            cryptoCurrency: getCriptoCoin(2),
            value: isWaiting ? '?' : coinValues[getCriptoCoin(2).toString()],
            selectedCurrency: toCoin,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
//              iOSPicker()
//            getPicker(),
                Platform.isIOS ? iOSPicker() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  CryptoCard({this.value, this.selectedCurrency, this.cryptoCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value  $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
