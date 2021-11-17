class UserDto {
  final String token;
  final String refreshToken;
  final String expiredTime;
  bool? showSwipeTutorial;

  UserDto({
    required this.expiredTime,
    required this.token,
    required this.refreshToken,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      token: json['token'],
      refreshToken: json['refreshToken'],
      expiredTime: json['ttlToken'],
    );
  }
}
