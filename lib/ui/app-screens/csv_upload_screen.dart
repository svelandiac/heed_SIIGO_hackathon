import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heed/controllers/http_requests.dart';
import 'package:heed/ui/common-widgets/essentials/app_button.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CSVUploadScreen extends StatefulWidget {
  @override
  _CSVUploadScreenState createState() => _CSVUploadScreenState();
}

class _CSVUploadScreenState extends State<CSVUploadScreen> {

  // Variables declaration
  MediaQueryData _mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText _appText; // We will use it for strings into the app
  HttpRequests _httpRequests;

  File csvFile;
  String fileName;

  static const _defaultMargin = 24.0;

  final uploadingSnackBar = SnackBar(
    content: Text('Subiendo el archivo...'),
    duration: Duration(days: 2),
  );

  final successSnackBar = SnackBar(
    content: Text('Archivo subido correctamente'),
    backgroundColor: Colors.green,
  );

  Future<void> _selectFile() async {
    csvFile = await FilePicker.getFile();
    setState(() {
      fileName = _getFileName(csvFile.path.toString());
    });
  }

  Future<void> _uploadFile(BuildContext scaffoldContext) async {

    Scaffold.of(scaffoldContext).showSnackBar(uploadingSnackBar);

    String userEmail = (await FirebaseAuth.instance.currentUser()).email;

    String path = 'CSV-files/$userEmail/$fileName';

    //Create a reference to the location you want to upload to in firebase
    final StorageReference storageReference = FirebaseStorage().ref().child(path);

    //Upload the file to firebase 
    StorageUploadTask uploadTask = storageReference.putFile(csvFile);

    String downloadURL = (await (await uploadTask.onComplete).ref.getDownloadURL()).toString();

    await _httpRequests.processCSVFile(downloadURL);

    Scaffold.of(scaffoldContext).hideCurrentSnackBar();
    Scaffold.of(scaffoldContext).showSnackBar(successSnackBar);
  }
 
  String _getFileName(String filePath) {
    int lastSlashPosition = 0;
    for(int i = 0; i < filePath.length ; i++) {
      if(filePath.substring(i).startsWith('/'))
        lastSlashPosition = i;
    }

    return filePath.substring(lastSlashPosition + 1);
  }

  Widget _buildFileSelectedRow() {
    return Padding(
      padding: const EdgeInsets.only(left: _defaultMargin + 15, right: _defaultMargin + 15),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              width: 150,
              child: Text(
                (csvFile == null) ?
                'No se han subido archivos' :
                fileName,
                style: TextStyle(
                  fontSize: 13.0
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            child: Text(
              'Seleccionar archivo',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.0
              ),
            ),
            onTap: () {
              _selectFile();
            },
          )
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return Builder(
      builder: (scaffoldContext) =>
        Center(
          child: AppButton(
            text: 'Subir archivo',
            onPressed: (csvFile != null) ?
            () {
              _uploadFile(scaffoldContext);
            } :
            null,
          ),
        ),
    );
  }

  Widget _buildBody() {
    return SafeScreen(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _mediaQueryData.size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.title('Subir mediante archivo CSV'),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.firstSubtitle(
                text: '¿Tienes toda la información de tus productos ordenada por tablas en un archivo CSV?'
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.firstSubtitle(
                text: 'Puedes subir el archivo por completo y nosotros lo procesaremos, ingresando dichos productos directamente en la base de datos'
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.firstSubtitle(
                text: 'Busca en el almacenamiento de tu teléfono el archivo, selecciónalo y presiona "Subir"'
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.firstSubtitle(
                text: 'El proceso puede tardar un poco, sé paciente'
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.08,
            ),
            _buildFileSelectedRow(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.08,
            ),
            _buildUploadButton()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Constant variables initialization
    _appText = AppText();
    _httpRequests = HttpRequests();
  }
  
  @override
  Widget build(BuildContext context) {

    // Variables initialization
    _mediaQueryData = MediaQuery.of(context);

    return _buildBody();
  }
}