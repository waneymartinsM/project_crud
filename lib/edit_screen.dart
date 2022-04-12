import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_crud/preview_page.dart';
import 'package:project_crud/widgets/anexo.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key,}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  File? arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async{
    final file = await picker.pickImage(source: ImageSource.gallery);

    if(file != null){
      setState(() => arquivo = File(file.path));
    }
  }

  showPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Column(
                      children: [
                        const SizedBox(height: 60.0,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 5, color: Colors.white),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(5, 5),),
                              ]
                          ),
                          child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
                        ),
                        const SizedBox(height: 12.0,),


                        if (arquivo!= null) Anexo(arquivo: arquivo!),

                        ElevatedButton.icon(
                          onPressed: ()async{
                            final ImagePicker _picker = ImagePicker();
                          },
                          icon: const Icon(Icons.camera_alt_outlined),
                          label: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text('Tire uma foto'),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              textStyle: const TextStyle(
                                fontSize: 12,
                              )),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('ou'),
                        ),
                        OutlinedButton.icon(
                          icon: const Icon(Icons.photo_library),
                          label: const Text('Selecione uma foto'),
                          onPressed: () => getFileFromGallery(),
                        ),
                      ],
                    ),
                  ]
              ),
        )
    );
  }
}