import 'package:http/http.dart' as http;
import 'dart:convert';

/*
esta clase se puede reutilizar con mucha facilidad
para cualquier otra conexion con una API
 */
class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  Future getData() async {
    http.Response response = await http.get(url);
    // comprobar el estado de la respuesta
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
