/// message : "success"
/// token : "42|UBgGYk426NSfj5oyagoikzRn4kCs7vuVPfhWxf96"
/// user_info : {"id":2,"roll_number":"1cst-125","dob":"2023-02-14","nrc":"-","phone":"098765432","address":"-","student_category_id":1,"user_id":2,"name":"zzw","email":"zzw@edu.mm","email_verified_at":null,"approved":1,"roles":[{"id":2,"title":"Student","pivot":{"user_id":2,"role_id":2}}]}

class LoginResponse {
  LoginResponse({
      this.message, 
      this.token, 
      this.userInfo,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    userInfo = json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }
  String? message;
  String? token;
  UserInfo? userInfo;
LoginResponse copyWith({  String? message,
  String? token,
  UserInfo? userInfo,
}) => LoginResponse(  message: message ?? this.message,
  token: token ?? this.token,
  userInfo: userInfo ?? this.userInfo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (userInfo != null) {
      map['user_info'] = userInfo?.toJson();
    }
    return map;
  }

}

/// id : 2
/// roll_number : "1cst-125"
/// dob : "2023-02-14"
/// nrc : "-"
/// phone : "098765432"
/// address : "-"
/// student_category_id : 1
/// user_id : 2
/// name : "zzw"
/// email : "zzw@edu.mm"
/// email_verified_at : null
/// approved : 1
/// roles : [{"id":2,"title":"Student","pivot":{"user_id":2,"role_id":2}}]

class UserInfo {
  UserInfo({
      this.id, 
      this.rollNumber, 
      this.dob, 
      this.nrc, 
      this.phone, 
      this.address, 
      this.studentCategoryId, 
      this.userId, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.approved, 
      this.roles,});

  UserInfo.fromJson(dynamic json) {
    id = json['id'];
    rollNumber = json['roll_number'];
    dob = json['dob'];
    nrc = json['nrc'];
    phone = json['phone'];
    address = json['address'];
    studentCategoryId = json['student_category_id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    approved = json['approved'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }
  num? id;
  String? rollNumber;
  String? dob;
  String? nrc;
  String? phone;
  String? address;
  num? studentCategoryId;
  num? userId;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  num? approved;
  List<Roles>? roles;
UserInfo copyWith({  num? id,
  String? rollNumber,
  String? dob,
  String? nrc,
  String? phone,
  String? address,
  num? studentCategoryId,
  num? userId,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  num? approved,
  List<Roles>? roles,
}) => UserInfo(  id: id ?? this.id,
  rollNumber: rollNumber ?? this.rollNumber,
  dob: dob ?? this.dob,
  nrc: nrc ?? this.nrc,
  phone: phone ?? this.phone,
  address: address ?? this.address,
  studentCategoryId: studentCategoryId ?? this.studentCategoryId,
  userId: userId ?? this.userId,
  name: name ?? this.name,
  email: email ?? this.email,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  approved: approved ?? this.approved,
  roles: roles ?? this.roles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roll_number'] = rollNumber;
    map['dob'] = dob;
    map['nrc'] = nrc;
    map['phone'] = phone;
    map['address'] = address;
    map['student_category_id'] = studentCategoryId;
    map['user_id'] = userId;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['approved'] = approved;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// title : "Student"
/// pivot : {"user_id":2,"role_id":2}

class Roles {
  Roles({
      this.id, 
      this.title, 
      this.pivot,});

  Roles.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? id;
  String? title;
  Pivot? pivot;
Roles copyWith({  num? id,
  String? title,
  Pivot? pivot,
}) => Roles(  id: id ?? this.id,
  title: title ?? this.title,
  pivot: pivot ?? this.pivot,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

/// user_id : 2
/// role_id : 2

class Pivot {
  Pivot({
      this.userId, 
      this.roleId,});

  Pivot.fromJson(dynamic json) {
    userId = json['user_id'];
    roleId = json['role_id'];
  }
  num? userId;
  num? roleId;
Pivot copyWith({  num? userId,
  num? roleId,
}) => Pivot(  userId: userId ?? this.userId,
  roleId: roleId ?? this.roleId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['role_id'] = roleId;
    return map;
  }

}