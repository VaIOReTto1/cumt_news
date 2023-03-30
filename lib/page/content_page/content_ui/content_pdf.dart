import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ContentPDF extends StatefulWidget {
  final String url;
  const ContentPDF({Key? key, required this.url}) : super(key: key);

  @override
  State<ContentPDF> createState() => _ContentPDFState();
}

class _ContentPDFState extends State<ContentPDF> {// 您的 PDF 文件路径

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: PDFView(
        filePath: widget.url,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageSnap: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.BOTH,
      ),
    );
  }
}