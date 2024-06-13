class Murid {
  String id;
  String email;
  String password;
  String namaLengkap;
  String jenisKelamin;
  String birthday;
  String nik;
  String role;
  String username;
  String createdBy;

  Murid({
    required this.id,
    required this.createdBy,
    required this.email,
    required this.password,
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.birthday,
    required this.nik,
    required this.role,
    required this.username,
  });

  Murid.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
          namaLengkap: json['namaLengkap']! as String,
          jenisKelamin: json['jenisKelamin']! as String,
          birthday: json['birthday']! as String,
          nik: json['nik']! as String,
          role: json['role']! as String,
          username: json['username']! as String,
          createdBy: json['createdBy']! as String,
        );

  Murid copyWith(
      {String? id,
      String? email,
      String? password,
      String? namaLengkap,
      String? jenisKelamin,
      String? birthday,
      String? nik,
      String? role,
      String? username,
      String? createdBy}) {
    return Murid(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      namaLengkap: namaLengkap ?? this.namaLengkap,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      birthday: birthday ?? this.birthday,
      nik: nik ?? this.nik,
      role: role ?? this.role,
      username: username ?? this.username,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'namaLengkap': namaLengkap,
      'jenisKelamin': jenisKelamin,
      'birthday': birthday,
      'nik': nik,
      'role': role,
      'username': username,
      'createdBy': createdBy,
    };
  }
}
