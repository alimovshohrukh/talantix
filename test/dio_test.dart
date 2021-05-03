import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter();

  dio.httpClientAdapter = dioAdapter;

  const path = 'https://api.binance.com/api/v3/ticker/24hr';

  dioAdapter
    ..onGet(
      path,
      (request) => request.reply(200, {'message': 'Successfully mocked GET!'}),
    );

  final onGetResponse = await dio.get(path);
  print(onGetResponse.data);
}
