import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl='https://flutter-amr.noviindus.in/api/';

  Future<http.Response> post(String endPoints,Map<String,dynamic> data)async {
  final url=Uri.parse(baseUrl + endPoints);
  final response=await http.post(url,body: data);
  return response;
  }
}