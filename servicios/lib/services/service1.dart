import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getApi() async {
  var url = Uri.parse("https://api.chucknorris.io/jokes/random");
  var resultado = await http.get(url);

  if (resultado.statusCode == 200) {
    var data = jsonDecode(resultado.body);
    return data['value']; // Devuelve el chiste como un String
  } else {
    throw Exception('Error de Petición: ${resultado.statusCode}');
  }
}
