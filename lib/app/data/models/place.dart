class Place {
  final String name;
  final String description;
  final String location;
  final String language;
  final double distance;
  final List<String> images;

  Place({
    required this.name,
    required this.description,
    required this.location,
    required this.language,
    required this.distance,
    required this.images,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      description: json['description'],
      location: json['location'],
      language: json['language'],
      distance: json['distance'].toDouble(),
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'language': language,
      'distance': distance,
      'images': images,
    };
  }
}
