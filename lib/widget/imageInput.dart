import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imageinput extends StatefulWidget {
  const Imageinput({super.key, required this.onPickImgae});

  final void Function(File image) onPickImgae;
  @override
  State<Imageinput> createState() => _ImageinputState();
}

class _ImageinputState extends State<Imageinput> {
  File? _selectedImage;
  void _takepicture() async {
    final imagepicker = ImagePicker();
    final Imgae =
        await imagepicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (Imgae == null) {
      return;
    }
    setState(() {
      _selectedImage = File(Imgae.path);
    });
    widget.onPickImgae(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takepicture,
      label: Text('Add Image'),
      icon: Icon(Icons.camera_alt),
    );
    if (_selectedImage == null) {
      content = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
      );
    }
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3))),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
