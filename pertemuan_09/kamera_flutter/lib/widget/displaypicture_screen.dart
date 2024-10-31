import 'dart:io';
import 'package:flutter/material.dart';

class DisplaypictureScreen extends StatelessWidget {
  const DisplaypictureScreen({super.key, required this.imagePath});
  
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2241720230')),
      body: Image.file(File(imagePath)),      
    );
  }
}