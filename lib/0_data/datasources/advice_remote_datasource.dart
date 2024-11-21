import 'dart:convert';

import 'package:advicer/0_data/exceptions/exceptions.dart';
import 'package:advicer/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  AdviceRemoteDatasourceImpl({required this.client});
  final http.Client client;

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    // final response = await client.get(
    //     Uri.parse('https://api.flutter-community.com/api/v1/advice'),
    //     headers: {'content-type': 'application/json'});

    // final responseBody = json.decode(response.body);
    // return AdviceModel.fromJson(responseBody);

    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'accept': 'application/json ',
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
