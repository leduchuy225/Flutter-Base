import 'note_viewmodel_response.dart';

class NoteListResponse {
  List<NoteViewmodelResponse>? note;

  NoteListResponse({this.note});

  factory NoteListResponse.fromJson(Map<String, dynamic> json) {
    return NoteListResponse(
      note: (json['_note'] as List<dynamic>?)
          ?.map(
            (e) => NoteViewmodelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    '_note': note?.map((e) => e.toJson()).toList(),
  };
}
