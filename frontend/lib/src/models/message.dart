import 'dart:convert';

import 'fake_user.dart';

class Message {
  final String id;
  final String message;
  final FakeUser sender;
  
  Message({
    required this.id,
    required this.message,
    required this.sender,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'message': message});
    result.addAll({'sender': sender.toMap()});
  
    return result;
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] ?? '',
      message: map['message'] ?? '',
      sender: FakeUser.fromMap(map['sender']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));

  Message copyWith({
    String? id,
    String? message,
    FakeUser? sender,
  }) {
    return Message(
      id: id ?? this.id,
      message: message ?? this.message,
      sender: sender ?? this.sender,
    );
  }

  @override
  String toString() => 'Message(id: $id, message: $message, sender: $sender)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Message &&
      other.id == id &&
      other.message == message &&
      other.sender == sender;
  }

  @override
  int get hashCode => id.hashCode ^ message.hashCode ^ sender.hashCode;
}
