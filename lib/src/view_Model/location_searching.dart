import 'package:http/http.dart' as http;
import 'dart:convert';


class GeocodingService {
  final String baseUrl = "https://nominatim.openstreetmap.org/search";

  Future<List<dynamic>> searchLocations(String query,
      {String language = 'en', String? countryCodes}) async {
    final url = Uri.parse(
        "$baseUrl?q=$query&format=json&addressdetails=1&accept-language=$language${countryCodes == null ? '' : '&countrycodes=$countryCodes'}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load locations');
    }
  }
}