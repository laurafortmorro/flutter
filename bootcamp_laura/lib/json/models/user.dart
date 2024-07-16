
import 'dart:core';
import 'package:bootcamp_laura/json/models/province.dart';
import 'package:bootcamp_laura/json/models/rol.dart';
import 'package:bootcamp_laura/json/models/university.dart';

import 'degree.dart';

class User{
  final int id;
  final String email;
  final String name;
  final String surname;
  final String avatarUrl;
  final DateTime? birthDate;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? facebookUrl;
  final String? tiktokUrl;
  final String? linkedinUrl;
  final String? state;
  final String? description;
  final int? followingCount;
  final int? followersCount;
  final int? topicsCount;
  final int? topicsLikedCount;
  final bool liked;
  final bool showEditProfile;
  final bool chatOpen;
  final bool pendingPetition;
  final String? chatId;
  final Rol rol;
  final University university;
  final Degree degree;
  final Province province;

  User({ required this.id, required this.email, required this.name, required this.surname, required this.avatarUrl, required this.rol, this.birthDate, this.instagramUrl,
    this.twitterUrl, this.facebookUrl, this.tiktokUrl, this.linkedinUrl, this.state, this.description, required this.followingCount,
    required this.followersCount, required this.topicsCount, required this.topicsLikedCount,  required this.liked, required this.showEditProfile, required this.chatOpen, required this.pendingPetition, this.chatId,
  required this.university, required this.province, required this.degree});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        surname: json['username'],
        avatarUrl: json['avatar_url'],
      birthDate: json['birth_date']!= null ? DateTime.parse(json['birth_date']) : null,
      instagramUrl: json['instagram_url'],
      facebookUrl: json['facebook_url'],
      twitterUrl: json['twitter_url'],
      tiktokUrl: json['tiktok_url'],
      linkedinUrl: json['linkedin_url'],
      state: json['state'],
      description: json['description'],
      followingCount: json['following_count'],
      followersCount: json['followers_count'],
      topicsCount: json['topics_count'],
      topicsLikedCount: json['topics_cliked_count'],
      liked: json['liked'],
      showEditProfile: json['show_edit_profile'],
      chatOpen: json['chat_open'],
      pendingPetition: json['pending_petition'],
      chatId: json['chat_id'],
      rol: Rol.fromJson(json['rol']),
      province: Province.fromJson(json['province']),
      degree: Degree.fromJson(json['degree']),
      university: University.fromJson(json['university']),

    );

  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, surname: $surname, avatarUrl: $avatarUrl, birthDate: $birthDate, instagramUrl: $instagramUrl, twitterUrl: $twitterUrl, facebookUrl: $facebookUrl, tiktokUrl: $tiktokUrl, linkedinUrl: $linkedinUrl, state: $state, description: $description, followingCount: $followingCount, followersCount: $followersCount, topicsCount: $topicsCount, topicsLikedCount: $topicsLikedCount, liked: $liked, showEditProfile: $showEditProfile, chatOpen: $chatOpen, pendingPetition: $pendingPetition, chatId: $chatId, rol: $rol, university: $university, degree: $degree, province: $province}';
  }
}