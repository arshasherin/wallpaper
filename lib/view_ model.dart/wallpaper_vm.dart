import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_project/constant/constant.dart';
import 'package:wallpaper_project/services/apiService.dart';

import '../model/model.dart';

class WallpaperViewModel extends ChangeNotifier {
  List<WallpaperModel> wallpaper = [];
  bool isLoading = false;
  int currentPage = 1;

  WallpaperViewModel() {
    fetchPhotos(1);
    notifyListeners();
  }

  Future<void> fetchPhotos(int page) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    try {
      final data = await ApiService().fetchWallpaper(page, 30);
      if (page == 1) {
        wallpaper = data.map((item) => WallpaperModel.fromJson(item)).toList();
      } else {
        wallpaper.addAll(data.map((item) => WallpaperModel.fromJson(item)).toList());
      }
      currentPage = page;
    } catch (e) {
      printx("error", e);
    }
    notifyListeners();
  }

  void fetchNextPage() {
    fetchPhotos(currentPage + 1);
    notifyListeners();
  }

  Future<void> downloadImage(String imageUrl, BuildContext context) async {
    try {
      Dio dio = Dio();
      Uri uri = Uri.parse(imageUrl);
      String fileName = uri.pathSegments.last;
      fileName = sanitizeFileName(fileName);
      if (!fileName.contains(RegExp(r'\.(jpg|jpeg|png|gif)$'))) {
        fileName = '$fileName.jpg';
      }

      String savePath;
      if (Platform.isAndroid || Platform.isIOS) {
        var directory = await getExternalStorageDirectory();
        if (directory != null) {
          savePath = "${directory.path}/$fileName";
        } else {
          throw Exception("Unable to access external storage");
        }
      } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        var directory = await getApplicationDocumentsDirectory();
        savePath = "${directory.path}/$fileName";
      } else {
        throw Exception("This platform does not support file download.");
      }

      await dio.download(imageUrl, savePath);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('Image downloaded', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: Colors.green, duration: const Duration(seconds: 3), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), behavior: SnackBarBehavior.floating, margin: const EdgeInsets.all(16)));
    } catch (e) {
      printx("Error downloading image: ", e);
    }
  }

  String sanitizeFileName(String fileName) {
    final invalidChars = RegExp(r'[<>:"/\\|?*]');
    return fileName.replaceAll(invalidChars, '_');
  }
}
