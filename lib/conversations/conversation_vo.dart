class ConverstationVO {
  final String id;
  //当前登录用户
  final String loginUser;

  //会话标识
  final String sessionId;

  final String nickName;
  //会话者头像
   String avatarUrl;
  //----------------以下更新-----------------
  //最后发送内容
  final String text;

  //最后发送时间
  final DateTime time;

  ConverstationVO(
      {
      this.id,
      this.loginUser,
      this.avatarUrl,
      this.sessionId,
      this.text,
      this.time, this.nickName});


   Map<String, dynamic> toJson() => _$ConverstationVoToJson(this);
  factory ConverstationVO.fromJson(Map<String, dynamic> json) => _$ConverstationVOFromJson(json);
}

ConverstationVO _$ConverstationVOFromJson(Map<String, dynamic> json) {
  return ConverstationVO(
    id:  json['id'] as String,
    loginUser: json['LoginUser'] as String,
    nickName: json['NickName'] as String,
    sessionId: json['SessionId'] as String,
    text: json['Text'] as String,
    time: DateTime.parse(json['Time']),
    avatarUrl: json['AvatarUrl'] as String,
  );
}

Map<String, dynamic> _$ConverstationVoToJson(ConverstationVO instance) =>
    <String, dynamic>{
      'LoginUser': instance.loginUser,
      'SessionId': instance.sessionId,
      'Text': instance.text,
      'Time': instance.time.toIso8601String(),
      'AvatarUrl': instance.avatarUrl,
      'NickName': instance.nickName
    };
