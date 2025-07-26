import 'networking.dart';

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
  'USG',
  'ZAR',
  'USD',
];

const List<String> cryptoList = ['bitcoin', 'ethereum', 'litecoin'];

class BitCoinData {
  String cryptoString = cryptoList.map((e) => e.toLowerCase()).join(',');
  String currencyString = currenciesList.map((e) => e.toLowerCase()).join(',');

  Future<dynamic> getCurrrencyData() async {
    NetworkHelper networkHelper = NetworkHelper(
      'https://api.coingecko.com/api/v3/simple/price?ids=$cryptoString&vs_currencies=$currencyString',
    );
    var coinData = await networkHelper.getData();
    return coinData;
  }
}
