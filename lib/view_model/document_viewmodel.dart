
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:lcms_app/Utils/utils.dart';
import 'package:provider/provider.dart';
import '../model/PostDocumentModel.dart';
import '../repository/document_rep.dart';
import 'dart:io';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadDocViewModel with ChangeNotifier {
  final UploadDocRepository _repository = UploadDocRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  File? _selectedDocument;
  String? _selectedDocumentName;

  String? get selectedDocumentName => _selectedDocumentName;

  void selectDocument() async {
    final pickedFile = await FilePicker.platform.pickFiles(type: FileType.any);

    if (pickedFile != null) {
      _selectedDocument = File(pickedFile.files.single.path!);
      _selectedDocumentName = pickedFile.files.single.name;
      notifyListeners();
    }
  }

  Future<void> uploadImageAndDocument(BuildContext context) async {
    setLoading(true);
    try {
      if (_selectedDocument != null) {
        UserViewModel userViewModel = Provider.of<UserViewModel>(context, listen: false);

        DocumentModel response = await _repository.uploadImageAndDocument(userViewModel, _selectedDocument!.path);
        String message = response.message ?? '';

        utilities.flushBarErrorSuccessMessage('Document Uploaded Successfully', context);

        // Reset selected document and name
        _selectedDocument = null;
        _selectedDocumentName = null;
      } else {
        utilities.flushBarErrorMessage('Please select a document', context);
      }

      setLoading(false);
    } catch (error) {
      setLoading(false);
      print('Error: $error');
    }
  }
}
