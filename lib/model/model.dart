
class WallpaperModel {
  final String id;
  final String url;
  final String description;

  WallpaperModel({required this.id, required this.url, required this.description});

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
      id: json['id'],
      url: json['urls']['small'],
      description: json['description'] ?? "No description",
    );
  }
}
