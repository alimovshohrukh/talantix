import 'package:talantix/model/symbol_model.dart';

class CryptoResponse {
  final List<BTCUSDT> results;
  final String error;

  CryptoResponse(this.results, this.error);

  CryptoResponse.fromJson(List json)
      : results = (json).map((i) => new BTCUSDT.fromJson(i)).toList(),
        error = "";

  CryptoResponse.withError(String errorValue)
      : results = [],
        error = errorValue;
}
