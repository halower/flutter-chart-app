import 'package:azlistview/azlistview.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class ContactVO extends ISuspensionBean{
   String id;
   String userName ;
   String department ;
   String position ;
   String officePhone ;
   String mobilePhone ;
   String roomNumber ;
   String shortPhone ;
   String homePhone ;
   String address ;
   String password ;
   String subDepartment ;
   String avatarUrl ;
   String namePinyin;
   String tagIndex;

  ContactVO({this.id,this.userName, this.department, this.position, this.officePhone, this.mobilePhone, 
  this.roomNumber, this.shortPhone, this.homePhone, 
  this.address, this.password, this.subDepartment, this.avatarUrl, this.namePinyin, this.tagIndex});

factory ContactVO.fromJson(Map<String, dynamic> json) => _$ContactVOFromJson(json);
  Map<String, dynamic> toJson() => _$ContactVoToJson(this);
  @override
  String getSuspensionTag() => tagIndex;
}

ContactVO _$ContactVOFromJson(Map<String, dynamic> json) {
  return ContactVO(
    id: json['id']as String,
    userName:    json['UserName']as String,
    department:  json['Department'] as String,
    subDepartment:json['SubDepartment']as String,
    position: json['Position'] as String,
    officePhone: json['OfficePhone'] as String,
    mobilePhone: json['MobilePhone'] as String,
    shortPhone: json['ShortPhone'] as String,
    homePhone:json['HomePhone']as String,
    roomNumber: json['RoomNumber'] as String,
    address:json['Address'] as String,
    avatarUrl: json['AvatarUrl'] as String
  );
}

Map<String, dynamic> _$ContactVoToJson(ContactVO instance) => <String, dynamic>{
      'UserName': instance.userName,
      'Department': instance.department,
      'SubDepartment': instance.subDepartment,
      'Position':instance.position,
      'OfficePhone': instance.officePhone,
      'MobilePhone': instance.mobilePhone,
      'ShortPhone': instance.shortPhone,
      'HomePhone': instance.homePhone,
      'RoomNumber': instance.roomNumber,
      'Address': instance.address,
      'AvatarUrl': instance.avatarUrl
};
