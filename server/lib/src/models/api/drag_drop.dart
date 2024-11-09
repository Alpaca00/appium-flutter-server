import 'package:appium_flutter_server/src/models/api/element.dart';

class DragAndDropModel {
  ElementModel source;
  ElementModel target;
  int? initialTimeout;
  int? moveTimeout;
  int? finalTimeout;

  DragAndDropModel(
      {required this.source,
      required this.target,
      this.initialTimeout,
      this.moveTimeout,
      this.finalTimeout});

  factory DragAndDropModel.fromJson(Map<String, dynamic> json) =>
      DragAndDropModel(
        source: ElementModel.fromJson(json['source'] as Map<String, dynamic>),
        target: ElementModel.fromJson(json['target'] as Map<String, dynamic>),
        initialTimeout: (json['initialTimeout'] as num?)?.toInt(),
        moveTimeout: (json['moveTimeout'] as num?)?.toInt(),
        finalTimeout: (json['finalTimeout'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'source': source,
        'target': target,
        'initialTimeout': initialTimeout,
        'moveTimeout': moveTimeout,
        'finalTimeout': finalTimeout,
      };
}
