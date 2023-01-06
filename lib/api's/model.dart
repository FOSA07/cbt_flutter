import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.results,
    });

    List<Result> results;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        // this.userId,
        required this.password,
        // this.lastLogin,
        // this.isSuperuser,
        required this.username,
        // this.isStaff,
        // this.isActive,
        // this.dateJoined,
        required this.firstName,
        required this.lastName,
        required this.email,
        // this.createdOn,
        // this.updatedOn,
        // this.groups,
        // this.userPermissions,
    });

    // String userId;
    String password;
    // DateTime lastLogin;
    // bool isSuperuser;
    String username;
    // bool isStaff;
    // bool isActive;
    // DateTime dateJoined;
    String firstName;
    String lastName;
    String email;
    // DateTime createdOn;
    // DateTime updatedOn;
    // List<dynamic> groups;
    // List<int> userPermissions;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        // userId: json["user_id"],
        password: json["password"],
        // lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        // isSuperuser: json["is_superuser"],
        username: json["username"],
        // isStaff: json["is_staff"],
        // isActive: json["is_active"],
        // dateJoined: DateTime.parse(json["date_joined"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        // createdOn: DateTime.parse(json["created_on"]),
        // updatedOn: DateTime.parse(json["updated_on"]),
        // groups: List<dynamic>.from(json["groups"].map((x) => x)),
        // userPermissions: List<int>.from(json["user_permissions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        // "user_id": userId,
        "password": password,
        // "last_login": lastLogin == null ? null : lastLogin.toIso8601String(),
        // "is_superuser": isSuperuser,
        "username": username,
        // "is_staff": isStaff,
        // "is_active": isActive,
        // "date_joined": dateJoined.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        // "created_on": createdOn.toIso8601String(),
        // "updated_on": updatedOn.toIso8601String(),
        // "groups": List<dynamic>.from(groups.map((x) => x)),
        // "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
    };
}
