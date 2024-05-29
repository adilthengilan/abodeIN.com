import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SerpApiPage extends StatefulWidget {
  @override
  _SerpApiPageState createState() => _SerpApiPageState();
}

class _SerpApiPageState extends State<SerpApiPage> {
  TextEditingController _searchController = TextEditingController();
  String _apiKey =
      '74fbda83d3b0ea4fddaa23df3b00cfab986c151cbcbd3cdcc526a898cbca831f';
  String _searchEngine = 'google';
  List<String> _searchResults = [];

  Future<void> _fetchSearchResults(String query) async {
    String url =
        'https://serpapi.com/search?q=$query&engine=$_searchEngine&api_key=$_apiKey';

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Request was successful
        var data = jsonDecode(response.body);
        // Extract search results
        List<dynamic> results = data['organic_results'];
        setState(() {
          _searchResults.clear();
          _searchResults.addAll(results.map((result) => result['title']));
        });
      } else {
        // Request failed
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SERP API Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(labelText: 'Enter search query'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String query = _searchController.text;
                if (query.isNotEmpty) {
                  _fetchSearchResults(query);
                }
              },
              child: Text('Fetch Search Results'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_searchResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
