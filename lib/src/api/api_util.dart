import 'package:http/http.dart' as http;

class ApiUtil {
  static const String MAIN_API_URL = '';
  // 'http://192.168.8.100/food/deploy1/public/api/';
  // http://127.0.0.1/food/deploy1/public/

  getData(apiUrl) async {
    String fullUrl = MAIN_API_URL + apiUrl;
    return await http.get(fullUrl, headers: _headers());
  }

  getAllCategories(apiUrl) async {
    String fullUrl = MAIN_API_URL + apiUrl;
    return await http.get(fullUrl, headers: _headers());
  }

  getPostsByCategory(apiUrl) async {
    String fullUrl = MAIN_API_URL + apiUrl;
    return await http.get(fullUrl, headers: _headers());
  }

  authentication(apiUrl, data) async {
    String fullUrl = MAIN_API_URL + apiUrl;
    return await http.post(fullUrl, headers: _authHeaders(), body: data);
  }

  _authHeaders() {
    Map<String, String> headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };
    return headers;
  }

  _headers() {
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': 'application/json'
    };
    return headers;
  }
}
