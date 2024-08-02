import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:map_page/utils/constants.dart';

class ApiRepository {
  Future<String> fetchImageData() async {
    /// calling image api
    final response = await http.get(Uri.parse(imageApiEndPoint));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['image'];
    } else {
      log("status code: ${response.statusCode} and \nbody: ${jsonDecode(response.body)}");
      throw Exception(
          'Failed to load image data, with status code: ${response.statusCode}');
    }
  }
}
