import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lcms_app/res/colors.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../view_model/document_viewmodel.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Upload Document',style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24)),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.file_upload,
                size: 100,
                color: Colors.grey,
              ),
              SizedBox(height: 16.0),
              Text(
                'Upload Document',
                style: TextStyle(
                  fontSize: 24.0,
                    fontFamily: 'Roboto_Slab_Bold'
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final viewModel =
                  Provider.of<UploadDocViewModel>(context, listen: false);
                  viewModel.selectDocument();
                },
                child: Text(
                  'Select Document',
                  style: TextStyle(
                    fontSize: 20.0,
                      fontFamily: 'Roboto_Slab_Bold'
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.drawerheadColor,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),

                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final viewModel =
                  Provider.of<UploadDocViewModel>(context, listen: false);
                  viewModel.uploadImageAndDocument(context);
                },
                child: Text(
                  'Upload',
                  style: TextStyle(
                    fontSize: 20.0,
                      fontFamily: 'Roboto_Slab_Bold'
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.drawerheadColor,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
