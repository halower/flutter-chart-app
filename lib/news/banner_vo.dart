
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class BannerVO {
   final String id;
   final String imageUrl;
   final String redictUrl;

  BannerVO({this.id, this.imageUrl, this.redictUrl});

  
factory BannerVO.fromJson(Map<String, dynamic> json) => _$BannerVOFromJson(json);
  Map<String, dynamic> toJson() => _$BannerVOToJson(this);
}

_$BannerVOFromJson(Map<String, dynamic> json) {
  return BannerVO(
     id: json['id']as String,
    imageUrl:    json['ImageUrl']as String,
    redictUrl:  json['RedictUrl'] as String,
  );
}


Map<String, dynamic>  _$BannerVOToJson(BannerVO instace) => <String, dynamic>{
    'id': instace.id,
    'ImageUrl':   instace.imageUrl,
    'RedictUrl':  instace.redictUrl
};