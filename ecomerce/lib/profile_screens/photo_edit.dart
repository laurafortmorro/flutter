import 'dart:io';
import 'package:ecomerce/profile_screens/profile.dart';
import 'package:ecomerce/provider/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PhotoEditPage extends StatefulWidget {
  const PhotoEditPage({super.key});

  @override
  State<PhotoEditPage> createState() => _PhotoEditPageState();
}

class _PhotoEditPageState extends State<PhotoEditPage> {
  // TODO: Que pugui ser null
   File?_image;
  late String _imageExample= Provider.of<UserProvider>(context).image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

  } //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final XFile? image= await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
        print('RUTA IMAGEN: ${image.path}');
      }
    });
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (photo != null) {
        _image = File(photo.path);
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    File fileExample= File(_imageExample);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.deepPurple,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Editar fotografía',
            style: TextStyle(color: Colors.black),
          ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Stack(
                children: [
                  _image == null
                      ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(fileExample)
                      )
                      : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(_image!),
                          //child:Image.file(_image)
                      ),

                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoEditPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).colorScheme.onPrimary
                              ),
                              color: Theme.of(context).colorScheme.primary
                          ),
                          child: IconButton(
                            onPressed: showOptions,
                            icon: Icon(Icons.edit),
                            color: Theme.of(context).colorScheme.onPrimary,
                            iconSize: Checkbox.width,
                          ),
                        ),
                      )
                  ),

                ],

              ),
              SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: (){
                    //comprovar si es null
                    _image != null
                        ? Provider.of<UserProvider>(context, listen: false).changeImage(
                      '${_image!.path}'
                    ): Provider.of<UserProvider>(context, listen: false).changeImage(
                      '${_imageExample}'
                    );
                    setState(() {
                      ProfilePage();
                    });
                    Navigator.of(context).push( MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: Text('ACTUALIZAR')
              )
            ],
          ),
        ),
      ),

    );
  }


}

