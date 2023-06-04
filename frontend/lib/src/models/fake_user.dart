import 'dart:convert';

class FakeUser {
  final String id;
  final String username;
  
  FakeUser({
    required this.id,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'username': username});
  
    return result;
  }

  factory FakeUser.fromMap(Map<String, dynamic> map) {
    return FakeUser(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FakeUser.fromJson(String source) => FakeUser.fromMap(json.decode(source));

  FakeUser copyWith({
    String? id,
    String? username,
  }) {
    return FakeUser(
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }

  @override
  String toString() => 'FakeUser(id: $id, username: $username)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FakeUser &&
      other.id == id &&
      other.username == username;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode;
}
