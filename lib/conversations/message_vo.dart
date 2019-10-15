class MessageVO {
  //当前登录用户
  final String loginUser;

  //会话标识
  final String sessionId;

  //发送者标识
  final String sender;

  //发送者头像
   String avatarUrl;

  //发送者昵称
  final String nickName;

  //发送内容
  final String text;

  //发送时间
  final DateTime time;

  MessageVO(
      {this.loginUser,
      this.sender,
      this.nickName,
      this.avatarUrl,
      this.sessionId,
      this.text,
      this.time});


   Map<String, dynamic> toJson() => _$MessageVoToJson(this);
  factory MessageVO.fromJson(Map<String, dynamic> json) => _$MessageVoFromJson(json);
}

MessageVO _$MessageVoFromJson(Map<String, dynamic> json) {
  return MessageVO(
    loginUser: json['LoginUser'] as String,
    sessionId: json['SessionId'] as String,
    sender: json['Sender'] as String,
    nickName: json['NickName'] as String,
    text: json['Text'] as String,
    time: DateTime.parse(json['Time']),
    avatarUrl: json['AvatarUrl'] as String,
  );
}

Map<String, dynamic> _$MessageVoToJson(MessageVO instance) =>
    <String, dynamic>{
      'LoginUser': instance.loginUser,
      'SessionId': instance.sessionId,
      'Sender': instance.sender,
      'NickName': instance.nickName,
      'Text': instance.text,
      'Time': instance.time.toIso8601String(),
      'AvatarUrl': instance.avatarUrl
    };
