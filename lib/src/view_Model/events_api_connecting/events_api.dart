import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventbriteApi extends ChangeNotifier {
  EventbriteApi() {
    fetchEvents('dubai');
  }

  Map<String, dynamic> event_List = {};
  int pageNumber = 10;
  static const String apiKey =
      'I2AWKT62ZFDYV6JAQC'; // Replace with your Eventbrite API key
  static const String baseUrl = 'https://www.eventbriteapi.com/v3/';

  Future<void> fetchEvents(String location) async {
    try {
      final response = await http.get(Uri.parse(
          'https://app.ticketmaster.com/discovery/v2/events?apikey=dx6vI4tZvgUWQ8IP6IdqOtvl6ihAMhej&locale=*&page=$pageNumber'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        event_List = data[
            "_embedded"]; // Ensure you access the correct part of the JSON response
        notifyListeners();
        print(event_List);
      } else {
        print('Failed to load events: ${response.statusCode}');
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch events: $e');
    }
  }
}
