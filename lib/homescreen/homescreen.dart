import 'package:app/homescreen/data_service.dart';
import 'package:flutter/material.dart';

import 'models.dart';
void main() {
  runApp( home());
}

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homeState();
}

class _homeState extends State<home> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response.weatherInfo.description)
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Search'))
              ],
            ),
          ),
        ));

  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}