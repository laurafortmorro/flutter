/*
class User {
  final int id;
  final String email;
  final String name;
  final String username;
  final String avatarUrl;
  final DateTime? birthDate;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? facebookUrl;
  final String? tiktokUrl;
  final String? linkedinUrl;
  final String? state;
  final String? description;
  final int followingCount;
  final int followersCount;
  final int topicsCount;
  final int topicsLikedCount;
  final bool liked;
  final bool showEditProfile;
  final bool chatOpen;
  final bool pendingPetition;
  final int? chatId;
  final Rol rol;
  final Province province;
  final Degree degree;
  final University university;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.avatarUrl,
    this.birthDate,
    this.instagramUrl,
    this.twitterUrl,
    this.facebookUrl,
    this.tiktokUrl,
    this.linkedinUrl,
    this.state,
    this.description,
    required this.followingCount,
    required this.followersCount,
    required this.topicsCount,
    required this.topicsLikedCount,
    required this.liked,
    required this.showEditProfile,
    required this.chatOpen,
    required this.pendingPetition,
    this.chatId,
    required this.rol,
    required this.province,
    required this.degree,
    required this.university,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      username: json['username'],
      avatarUrl: json['avatar_url'],
      birthDate: json['birth_date'] != null ? DateTime.parse(json['birth_date']) : null,
      instagramUrl: json['instagram_url'],
      twitterUrl: json['twitter_url'],
      facebookUrl: json['facebook_url'],
      tiktokUrl: json['tiktok_url'],
      linkedinUrl: json['linkedin_url'],
      state: json['state'],
      description: json['description'],
      followingCount: json['following_count'],
      followersCount: json['followers_count'],
      topicsCount: json['topics_count'],
      topicsLikedCount: json['topics_liked_count'],
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
}

class Rol {
  final int id;
  final String name;
  final String color;
  final String helper;
  final Map<int, String> statusRoles; // Ahora es un mapa

  Rol({
    required this.id,
    required this.name,
    required this.color,
    required this.helper,
    required this.statusRoles,
  });

  factory Rol.fromJson(Map<String, dynamic> json) {
    var statusRolesMap = json['status_roles'] as Map<String, dynamic>;
    Map<int, String> statusRoles = {};
    statusRolesMap.forEach((key, value) {
      statusRoles[int.parse(key)] = value as String;
    });

    return Rol(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      helper: json['helper'],
      statusRoles: statusRoles,
    );
  }
}

class Province {
  final int id;
  final String name;

  Province({
    required this.id,
    required this.name,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Degree {
  final int id;
  final String name;
  final String abbreviation;

  Degree({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  factory Degree.fromJson(Map<String, dynamic> json) {
    return Degree(
      id: json['id'],
      name: json['name'],
      abbreviation: json['abbreviation'],
    );
  }
}

class University {
  final int id;
  final String name;
  final String acronym;
  final Province province;

  University({
    required this.id,
    required this.name,
    required this.acronym,
    required this.province,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      name: json['name'],
      acronym: json['acronym'],
      province: Province.fromJson(json['province']),
    );
  }
}
*/
