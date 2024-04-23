import 'package:json_annotation/json_annotation.dart';
part 'start_page.g.dart';

@JsonSerializable()
class StartPageData {
  final String title;
  final String description;
  final String image;

  StartPageData({required this.title, required this.description, required this.image});

  factory StartPageData.fromJson(Map<String, dynamic> json) =>
      _$StartPageDataFromJson(json);

  Map<String, dynamic> toJson() => _$StartPageDataToJson(this);
}
