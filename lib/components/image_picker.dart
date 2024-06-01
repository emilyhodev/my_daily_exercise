import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerComponent extends StatefulWidget {
  final Function(File? image) onImageSelected;

  const ImagePickerComponent({required this.onImageSelected});

  @override
  _ImagePickerComponentState createState() => _ImagePickerComponentState();
}

class _ImagePickerComponentState extends State<ImagePickerComponent> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      widget.onImageSelected(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image != null
            ? CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(_image!),
              )
            : CircleAvatar(
                radius: 80,
                child: Icon(Icons.image),
              ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Select Image'),
        ),
      ],
    );
  }
}