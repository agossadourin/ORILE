class ImageDescriptorModel {
  final String francais;
  final String anglais;
  final String espagnol;
  final String yoruba;

  ImageDescriptorModel({
    required this.francais,
    required this.anglais,
    required this.espagnol,
    required this.yoruba,
  });

  factory ImageDescriptorModel.fromJson(Map<String, dynamic> json) {
    return ImageDescriptorModel(
      francais: json['francais'],
      anglais: json['anglais'],
      espagnol: json['espagnol'],
      yoruba: json['yoruba'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'francais': francais,
      'anglais': anglais,
      'espagnol': espagnol,
      'yoruba': yoruba,
    };
  }
}
