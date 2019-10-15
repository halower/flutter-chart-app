import 'package:azlistview/azlistview.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class TopContactVO  extends ISuspensionBean{
  final String id;
  final String userId;
  final String topcontactId;
  String tagIndex;

TopContactVO({this.id, this.userId, this.topcontactId, this.tagIndex});

factory TopContactVO.fromJson(Map<String, dynamic> json) => _$TopContactVOFromJson(json);
  Map<String, dynamic> toJson() => _$TopContactVOToJson(this);
  @override
  String getSuspensionTag() => tagIndex;
}

TopContactVO _$TopContactVOFromJson(Map<String, dynamic> json) {
  return TopContactVO(
    id:  json['id']as String,
    userId: json['UserId']as String,
    topcontactId:  json['TopContactId'] as String,
  );
}

Map<String, dynamic> _$TopContactVOToJson(TopContactVO instance) => <String, dynamic>{
      'UserId': instance.userId,
      'TopContactId': instance.topcontactId,
};