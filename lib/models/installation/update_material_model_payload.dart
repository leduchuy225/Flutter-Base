class UpdateMaterialModelPayload {
  num? id;
  num? materialId;
  num? quantity;

  UpdateMaterialModelPayload({this.id, this.materialId, this.quantity});

  factory UpdateMaterialModelPayload.fromJson(Map<String, dynamic> json) {
    return UpdateMaterialModelPayload(
      id: json['ID'] as num?,
      materialId: json['Material_ID'] as num?,
      quantity: json['Quantity'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'Material_ID': materialId,
    'Quantity': quantity,
  };
}
