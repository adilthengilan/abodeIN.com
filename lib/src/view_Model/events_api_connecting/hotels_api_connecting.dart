import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HotelsConnectingApi extends ChangeNotifier {
  List<dynamic> Hotels = [];
  final String apiKey = '7caa571b52msh90814565c44d074p11773fjsnacbfdbbe862e';
  final String baseUrl =
      'https://hotels-com-provider.p.rapidapi.com/v2/regions?query=Prag&domain=AE&locale=en_GB';

  Future<dynamic> searchHotels(
      String location, String checkinDate, String checkoutDate) async {
    try {
      final String endpoint = '$baseUrl/hotels/search';
      final Map<String, String> headers = {
        'x-rapidapi-key': apiKey,
        'x-rapidapi-host': 'hotels-com-provider.p.rapidapi.com'
      };
      final Map<String, String> params = {
        'location': location,
        'checkin_date': checkinDate,
        'checkout_date': checkoutDate
      };

      final Uri uri = Uri.parse(endpoint).replace(queryParameters: params);
      final http.Response response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        print('=====================================');
        Hotels = jsonDecode(response.body);
      } else {
        print('errorr${response.statusCode}');
      }
    } catch (e) {
      print('eorrrrooooooooooooo$e');
    }
  }
}
