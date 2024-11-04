import 'package:talky/utils/profile_state.dart';

class UserModel {
  final String? email;
  final String? name;
  final String? image;
  final String? uid;
  final String? description;
  final ProfileState? profileState;
  final DateTime? lastTime;

  const UserModel({
    this.email,
    this.name,
    this.image,
    this.description,
    this.uid,
    this.profileState,
    this.lastTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        uid: json['uid'],
        profileState: ProfileState.fromString(
          json['profile_state'] ?? ProfileState.initial,
        ),
        lastTime: json['last_time'] != null && json['last_time'] is int
            ? DateTime.fromMillisecondsSinceEpoch(json['last_time'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (name != null) 'name': name,
        if (image != null) 'image': image,
        if (description != null) 'description': description,
        if (uid != null) 'uid': uid,
        if (profileState != null) 'profile_state': profileState?.name,
        if (lastTime != null) 'last_time': lastTime?.millisecondsSinceEpoch,
      };
}
