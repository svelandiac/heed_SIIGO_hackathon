import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseRepository {

  // This will be the repository where we are going to connect with the database
  // Here you can make CRUD operations as follows:
  // 1. Create a document into the database.
  // 2. Read a document into the database.
  // 3. Update a document into the database.
  // 4. Delete a document into the database.

  Firestore _firestore;

  DatabaseRepository() {
    this._firestore = Firestore.instance;
  }

  // To create a document, you have two options:
  // Create a document with an ID generated automatically: For that you must set the
  // "generateIDautomatically" parameter in true, and the "documentID" parameter will be ignored;
  // otherwise you must pass the ID and it will be generated with it.
  // 
  // Something important to note is that you must to pass the "collection" as a string 
  // parameter. The document will be created in that collection into the database.
  //
  // "payload" parameter will be the information that it will be saved into the document created.

  Future createADocument({String collection, String documentID, bool generateIDautomatically, dynamic payload}) {

    if (generateIDautomatically) {

      return this._firestore.collection(collection).add(payload);

    }

    else {

      return this._firestore.collection(collection).document(documentID).setData(payload);

    }
  }

  // To read a document, you must pass the collection, the documentID, and it will return 
  // a DocumentSnapshot that you will use for extracting the data into a model.

  Future readADocument({String collection, String documentID}) {

    return this._firestore.collection(collection).document(documentID).get();

  }

  // To update a document you must pass the collection, the documentID and the payload
  // Also you must to specify if you want to merge both sources (the database and the payload)
  // or if you want to overwrite the document. By default it will merge them.

  Future updateADocument({String collection, String documentID, dynamic payload, bool merge = true}) {

    return this._firestore.collection(collection).document(documentID).setData(payload, merge: merge);

  }

  // To delete a document you must pass the collection and the documentID

  Future deleteADocument({String collection, String documentID}) {
    
    return this._firestore.collection(collection).document(documentID).delete();

  }

}