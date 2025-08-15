class UpdateMaterialModelPayload {
  int? id;
  int? materialId;
  num? quantity;

  UpdateMaterialModelPayload({this.id, this.materialId, this.quantity});

  factory UpdateMaterialModelPayload.fromJson(Map<String, dynamic> json) {
    return UpdateMaterialModelPayload(
      id: json['ID'] as int?,
      materialId: json['Material_ID'] as int?,
      quantity: json['Quantity'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'Material_ID': materialId,
    'Quantity': quantity,
  };
}
