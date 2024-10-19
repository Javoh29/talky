import 'package:talky/utils/profile_state.dart';

class UserModel {
  final String? email;
  final String? name;
  final String? image;
  final String? uid;
  final String? description;
  final ProfileState? profileState;

  const UserModel({
    this.email,
    this.name,
    this.image,
    this.description,
    this.uid,
    this.profileState,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        uid: json['uid'],
        profileState: ProfileState.fromString(
          json['profile_state'],
        ),
      );

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (name != null) 'name': name,
        if (image != null) 'image': image,
        if (description != null) 'description': description,
        if (uid != null) 'uid': uid,
        if (profileState != null) 'profile_state': profileState?.name,
      };
}
