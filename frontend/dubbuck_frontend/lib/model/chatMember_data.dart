class ChatMember {
  String name;
  String id;
  String role;

  ChatMember({
    required this.name,
    required this.id,
    required this.role,
  });

  factory ChatMember.fromJson(Map<String, dynamic> json) {
    return ChatMember(
      name: json['name'],
      id: json['id'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'role': role,
    };
  }
}
