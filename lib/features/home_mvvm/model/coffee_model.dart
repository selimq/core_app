import 'package:core_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee_model.g.dart';

@JsonSerializable()
class Coffee extends IBaseModel {
  String? title;
  String? description;
  List<String>? ingredients;
  int? id;

  Coffee({this.title, this.description, this.ingredients, this.id});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CoffeeFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CoffeeToJson(this);
  }
}
