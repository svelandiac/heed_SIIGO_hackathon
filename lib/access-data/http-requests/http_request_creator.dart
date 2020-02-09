import 'package:http/http.dart';

class HttpRequestCreator {

  Future<String> makePostRequest(String url, String jsonParameters) async {

    // set up POST request arguments
    Map<String, String> headers = {"Content-type": "application/json"};
    // make POST request
    Response response = await post(url, headers: headers, body: jsonParameters);
    // check the status code for the result
    // int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;

    return body;
  }

}