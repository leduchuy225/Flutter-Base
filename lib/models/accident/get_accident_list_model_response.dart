class GetAccidentListModelResponse {
  int? id;
  String? text;

  GetAccidentListModelResponse({this.id, this.text});

  factory GetAccidentListModelResponse.fromJson(Map<String, dynamic> json) {
    return GetAccidentListModelResponse(
      id: json['id'] as int?,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'text': text};
}
