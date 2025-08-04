// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildImageField extends StatefulWidget {
  final ValueChanged<File?> onImageChanged;

  const BuildImageField({
    super.key,
    required this.onImageChanged,
  });

  @override
  State<BuildImageField> createState() => _BuildImageFieldState();
}

class _BuildImageFieldState extends State<BuildImageField> {
  File? fileImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          setState(() {
            isLoading = true;
          });
          await pickImage();
        } on Exception {
          setState(() {
            isLoading = false;
          });
        }
        setState(() {
          isLoading = false;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: fileImage != null
                  ? Image.file(fileImage!)
                  : const Icon(
                      Icons.image_outlined,
                      size: 180,
                    ),
            ),
            Visibility(
              visible: fileImage != null && isLoading == false,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    widget.onImageChanged(fileImage);
                  });
                },
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    widget.onImageChanged(fileImage!);
  }
}
