import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talantix/providers/api_provider.dart';

class CryptoWidget extends StatefulWidget {
  const CryptoWidget({this.index});

  final int index;

  @override
  State<StatefulWidget> createState() {
    return _CryptoWidgetState();
  }
}

class _CryptoWidgetState extends State<CryptoWidget> {
  ApiProvider _apiProvider;

  bool _isLoading = false;
  String _lastPrice = 'Press Me';

  get lastPrice => _lastPrice;

  get isLoading => _isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MaterialButton(
          child: _isLoading
              ? _buildLoadingWidget()
              : Text(
                  lastPrice,
                  style: TextStyle(fontSize: 12.0),
                ),
          textColor: Colors.white,
          color: Colors.blueGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          onPressed: () => {
                if (_lastPrice == 'Press Me')
                  {
                    _isLoading = true,
                    setState(() {}),
                    _apiProvider = ApiProvider(),
                    _apiProvider.fetchData().then((value) => {
                          value.results.forEach((element) {
                            if (element.symbol == 'BTCUSDT') {
                              _lastPrice = element.lastPrice;
                              print(element.symbol);
                              _isLoading = false;
                              setState(() {});
                            }
                          })
                        }),
                    debugPrint('BTCUSDT: ${widget.index}'),
                  }
                else
                  {_lastPrice = 'Press Me', setState(() {})}
              }),
    );
  }

  Widget _buildLoadingWidget() {
    return CupertinoActivityIndicator();
  }
}
