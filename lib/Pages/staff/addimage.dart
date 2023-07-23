import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_managment_app/Widgets/viewallcustomers.dart';
import 'package:loan_managment_app/api_endpoints.dart';

class AddImage extends StatefulWidget {
  final int id;
  const AddImage({super.key, required this.id});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  late int id;
  File? _selectedimage;

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }

  Future _pickImage(ImageSource source) async {
  final retuneredImage =  await ImagePicker().pickImage(source: source);

  if (retuneredImage != null) {
    setState(() {
      _selectedimage = File(retuneredImage.path);
    });
  }
  }

  Future<void> _cropImage () async {
    if (_selectedimage == null) {
      return;
    }

    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: _selectedimage!.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (cropped != null) {
      setState(() {
        _selectedimage = File(cropped.path);
      });
    }
  }

  void _clear() {
    setState(() {
      _selectedimage = null;
    });
  }

  Future<void> _uploadImage( File file) async {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.updateProfilePicture(id));
    var request = http.MultipartRequest('PATCH', url);
    request.files.add(await http.MultipartFile.fromPath('profileimage', file.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded and customer data updated successfully');
        Get.back();
        // Handle any further response from the server if needed.
      } else {
        print('Image upload failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Image"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(onPressed: () {_pickImage(ImageSource.camera);},
           child: const Text("Pick Image From Camera"),
           ),
            TextButton(onPressed: () {_pickImage(ImageSource.gallery);},
            child: const Text("Pick Image From Gallery"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {_cropImage();},
                child: const Text("Crop Image"),
                ),
                TextButton(onPressed: () {_uploadImage(_selectedimage!);},
                child: const Text("Upload Image"),
                ),
              ],
            ),
            TextButton(onPressed: () {_clear();}, child: const Text("Clear"),),
            const SizedBox(height: 20,),
            _selectedimage != null ? Expanded(child: Image.file(_selectedimage!)) : const Text("No Image Selected"),
          
        ],
      ),
    );
  }
}

