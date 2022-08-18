class SliderModel {
  String? id;

  String? imageUrl;

  SliderModel({
    required this.imageUrl,
  });

  SliderModel.fromMap(Map<String, dynamic> map) {
    imageUrl = map['imageUrl'];
  }

  toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }
}
