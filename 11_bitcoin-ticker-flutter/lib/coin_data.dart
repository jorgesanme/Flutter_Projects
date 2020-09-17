import 'package:bitcoin_ticker/price_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '85E9829B-B560-484E-8D1D-617176729B2E';
const apiUrl = 'https://rest.coinapi.io/v1/exchangerate';
//ejemplo de url
//https://rest.coinapi.io/v1/exchangerate/BTC/EUR?apikey=85E9829B-B560-484E-8D1D-617176729B2E

class CoinData {
  Future getCoinData(String fromCoin, String toCoin) async {
    String url = '$apiUrl/$fromCoin/$toCoin?apikey=$apiKey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      int temp = lastPrice.toInt();
      return temp.toString;
//      var quote = decodedData['asset_id_quote'];
//        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'problemas con la peticion GET';
    }

//    Map<String, String> cryptoPrices = {};
//    for (String crypto in cryptoList) {
//      String url = '$apiUrl/$crypto/$toCoin?apikey=$apiKey';
//      http.Response response = await http.get(url);
//      // comprobar el estado de la respuesta
//      if (response.statusCode == 200) {
//        var decodedData = jsonDecode(response.body);
//        double lastPrice = decodedData['rate'];
////      var quote = decodedData['asset_id_quote'];
//        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
//      } else {
//        print(response.statusCode);
//        throw 'problemas con la peticion GET';
//      }
//    }
  }
}
