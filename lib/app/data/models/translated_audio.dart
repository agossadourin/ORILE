class TranslatedAudio {
  final String text;
  final String link;

  TranslatedAudio({
    required this.text,
    required this.link,
  });

  factory TranslatedAudio.fromJson(Map<String, dynamic> json) {
    return TranslatedAudio(
      text: json['text'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'link': link,
    };
  }
}
