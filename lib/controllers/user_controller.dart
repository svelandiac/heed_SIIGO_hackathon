import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heed/access-data/database/database_repository.dart';
import 'package:heed/access-data/models/user.dart';
import 'package:heed/controllers/http_requests.dart';

class UserController {

  // This class allows us to make CRUD operations with users in Database.
  // It is not the auth service, it handles the user information in db.

  DatabaseRepository _databaseRepository;
  User _userProvider;
  HttpRequests _httpRequests;

  UserController(User userProvider) {
    _databaseRepository = DatabaseRepository();
    this._userProvider = userProvider;
    this._httpRequests = HttpRequests();
  }

  String _avoidNullValues(value) {

    if (value == null) 
      return '';

    else 
      return value;
  }

  Future<bool> bringUserInformation({String email}) async {

    // Brings the user information associated to the unique ID (in this case is the email) and assigns it to
    // the provider.
    
    String collectionName = 'users';

    try {

      DocumentSnapshot documentSnapshot = await _databaseRepository.readADocument(
        collection: collectionName,
        documentID: email
      );

      _userProvider.email = _avoidNullValues(documentSnapshot.data['email']);
      _userProvider.name = _avoidNullValues(documentSnapshot.data['name']);
      _userProvider.company = _avoidNullValues(await _httpRequests.bringCompanyName(email));


      _userProvider.hasInformation = true;

      return true;

    } 
    catch (e) {
      print(e);
      return false;
    }

  }

}