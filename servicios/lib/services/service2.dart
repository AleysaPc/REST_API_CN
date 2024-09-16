import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getCategoria(String categoria) async {
  var url =
      Uri.parse("https://api.chucknorris.io/jokes/random?category=$categoria");
  var respuesta = await http.get(url);

  if (respuesta.statusCode == 200) {
    var jsonRespuesta = jsonDecode(respuesta.body);
    return jsonRespuesta['value'];
  } else {
    throw Exception("Falla al cargar el chite");
  }
}
