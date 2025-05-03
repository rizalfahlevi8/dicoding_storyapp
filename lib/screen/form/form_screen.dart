import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common.dart';
import 'package:story_app/provider/form/form_provider.dart';
import 'package:story_app/provider/form/upload_provider.dart';
import 'package:story_app/routes/page_manager.dart';

class FormScreen extends StatefulWidget {
  final Function onSend;
  const FormScreen({super.key, required this.onSend});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.formTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200, // Atur tinggi sesuai kebutuhan
                child:
                    context.watch<FormProvider>().imagePath == null
                        ? const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.image, size: 100),
                        )
                        : _showImage(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _onGalleryView,
                      child: Text(AppLocalizations.of(context)!.galleryButton),
                    ),
                    ElevatedButton(
                      onPressed: _onCameraView,
                      child: Text(AppLocalizations.of(context)!.cameraButton),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.errorDescription;
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: AppLocalizations.of(context)!.descriptionHint),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              context.watch<UploadProvider>().isUploading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                    child: ElevatedButton(
                      onPressed:
                          () => {
                            if (formKey.currentState!.validate()) {_onUpload()},
                          },
                      child: Text(AppLocalizations.of(context)!.uploadButton),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  _onUpload() async {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);

    final uploadProvider = context.read<UploadProvider>();
    final formProvider = context.read<FormProvider>();
    final imagePath = formProvider.imagePath;
    final imageFile = formProvider.imageFile;
    if (imagePath == null || imageFile == null) return;

    final fileName = imageFile.name;
    final bytes = await imageFile.readAsBytes();

    final newBytes = await uploadProvider.compressImage(bytes);

    await uploadProvider.upload(newBytes, fileName, descriptionController.text);

    if (uploadProvider.uploadResponse != null) {
      formProvider.setImageFile(null);
      formProvider.setImagePath(null);

      widget.onSend();
      context.read<PageManager<String>>().returnData(uploadProvider.message);
    } else {
      scaffoldMessengerState.showSnackBar(
        SnackBar(
          content: Text(uploadProvider.message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  _onGalleryView() async {
    final provider = context.read<FormProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  _onCameraView() async {
    final provider = context.read<FormProvider>();

    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isiOS);
    if (isNotMobile) return;

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  Widget _showImage() {
    final imagePath = context.read<FormProvider>().imagePath;
    return Center(
      child: kIsWeb
          ? Image.network(imagePath.toString(), fit: BoxFit.contain)
          : Image.file(File(imagePath.toString()), fit: BoxFit.contain),
    );
  }
}
