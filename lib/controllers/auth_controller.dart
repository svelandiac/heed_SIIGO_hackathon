import 'package:heed/access-data/database/authentication.dart';
import 'package:heed/access-data/database/database_repository.dart';
import 'package:heed/access-data/models/user.dart';
import 'package:heed/controllers/text_input_controller.dart';
import 'package:validate/validate.dart';

class AuthController {

  TextInputController textInputController = TextInputController();
  Authentication authentication = Authentication();
  DatabaseRepository databaseRepository = DatabaseRepository();

  AuthController();

  bool isAnEmail(String text){
    // Here we will check if an input string is an email.
    // If it is, so we return true, otherwise we return false.

    // First we have to check if the input string is secure
    if(!textInputController.checkSecurity(text))
      return false;

    // Now we have to check if it is an email
    try {
      Validate.isEmail(text);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool isAPassword(String text){
    // Here we will check if an input string is a valid password.
    // If it is, we return true, otherwise we return false.

    // First we have to check if the input string is secure
    if(!textInputController.checkSecurity(text))
      return false;

    // Now we have to check if it is a valid password
    if (text.length >= 8) {
      return true;
    }
    else {
      return false;
    }
  }

  Future<bool> loginWithEmailAndPassword({String email, String password, User userProvider}) async {

    // This is the method for login into the app
    // We will check if the information is valid. 
    // If it is, we will use the authentication service provided by the database

    // First we have to check if information is valid. If not, we will return false.
    if ( !(this.isAnEmail(email) && this.isAPassword(password)) ) {
      return false;
    }    

    // Now we have to use the authentication service. If it logs in, we return true, otherwise we return false.
    try {
      await authentication.signInWithEmailAndPassword(email, password);
      userProvider.logged = true;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createAnAccountWithEmail({String email, String password}) async {

    return true;

  }

  Future<bool> logOut({User userProvider}) async {
    // This is the method for close the current session.
    // We don't need inputs, just call this method.
    try {
      await authentication.signOut();
      userProvider.logged = false;
      return true;
    } catch (error) {
      print(error);
      return false;
    }

  }
}