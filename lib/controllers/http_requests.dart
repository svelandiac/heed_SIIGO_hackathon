import 'package:heed/access-data/http-requests/http_request_creator.dart';

class HttpRequests {

  HttpRequestCreator _httpRequestCreator = HttpRequestCreator();

  Future<String> bringCompanyName(String email) async {

    String jsonParameters = '{"email": "$email"}';

    String companyName = await _httpRequestCreator.makePostRequest('https://us-central1-heed-siigo-hackathon.cloudfunctions.net/getMyCompany', jsonParameters);

    return companyName;
  } 


  Future<void> processCSVFile(String csvURL) async {

    String jsonParameters = '{"csvURL": "$csvURL"}';

    var productsList = await _httpRequestCreator.makePostRequest('https://us-central1-heed-siigo-hackathon.cloudfunctions.net/processCSVfile', jsonParameters);

    print(productsList);
  } 


}