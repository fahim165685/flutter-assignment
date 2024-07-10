
List<ItemModel> itemModelFromMap(dynamic str) => str==null?[]:  List<ItemModel>.from(str.map((x) => ItemModel.fromMap(x)));


class ItemModel {
  String? date;
  String? name;
  String? category;
  String? location;

  ItemModel({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
    date: json["date"],
    name: json["name"],
    category: json["category"],
    location: json["location"],
  );

}
