import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

class PreviewPage extends StatelessWidget {
  File file ;
  PreviewPage({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Stack(
            children: [
              Positioned.fill(child: Image.file(
                file, fit: BoxFit.cover,
              )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () => Get.back(result: file),
                            icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
          ),
        ],
      ),
    );
  }
}