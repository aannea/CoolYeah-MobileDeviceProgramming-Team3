class Murid {
  String email;
  String password;
  String namaLengkap;
  String jenisKelamin;
  String birthday;
  String nik;
  String role;
  String username;

  Murid(
      {required this.email,
      required this.password,
      required this.namaLengkap,
      required this.jenisKelamin,
      required this.birthday,
      required this.nik,
      required this.role,
      required this.username});

  Murid.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String,
          password: json['password']! as String,
          namaLengkap: json['namaLengkap']! as String,
          jenisKelamin: json['jenisKelamin']! as String,
          birthday: json['birthday']! as String,
          nik: json['nik']! as String,
          role: json['role']! as String,
          username: json['username']! as String,
        );

  Murid copyWith(
      {String? email,
      String? password,
      String? namaLengkap,
      String? jenisKelamin,
      String? birthday,
      String? nik,
      String? role,
      String? username}) {
    return Murid(
      email: email ?? this.email,
      password: password ?? this.password,
      namaLengkap: namaLengkap ?? this.namaLengkap,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      birthday: birthday ?? this.birthday,
      nik: nik ?? this.nik,
      role: role ?? this.role,
      username: username ?? this.username,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'password': password,
      'namaLengkap': namaLengkap,
      'jenisKelamin': jenisKelamin,
      'birthday': birthday,
      'nik': nik,
      'role': role,
      'username': username,
    };
  }
}
