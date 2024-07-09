import 'package:http/http.dart' as http;
import 'dart:convert'; // to covert jsone file

const apiKey = '267868326ec038fd9b7bc94b94ea8e6f';

class netWork {

  netWork({
    required this.url,
  });
  String url;

  Future getDATA() async {
    try {
      final uri = Uri.parse(url);
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
