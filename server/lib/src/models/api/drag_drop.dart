import 'package:appium_flutter_server/src/models/api/element.dart';

class DragAndDropModel {
  ElementModel source;
  ElementModel target;
  Map<String, dynamic>? elementOptions;

  DragAndDropModel({
    required this.source,
    required this.target,
    this.elementOptions,
  });

  factory DragAndDropModel.fromJson(Map<String, dynamic> json) =>
      DragAndDropModel(
        source: ElementModel.fromJson(json['source'] as Map<String, dynamic>),
        target: ElementModel.fromJson(json['target'] as Map<String, dynamic>),
        elementOptions: json['elementOptions'] != null
            ? json['elementOptions'] as Map<String, dynamic>
            : null,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'source': source.toJson(),
    'target': target.toJson(),
    'widgetOptions': elementOptions,
  };
}
