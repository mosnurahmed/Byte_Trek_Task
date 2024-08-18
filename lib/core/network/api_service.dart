import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/location_model.dart';
import '../constants/strings.dart';

class ApiService {
  Future<List<LocationModel>> fetchLocations() async {
    final response = await http.get(Uri.parse(AppStrings.baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => LocationModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
