import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
    Student({
        required this.id,
        required this.ipno,
        required this.perid,
        required this.admitdate,
        required this.dischargedate,
        required this.doctorname,
        required this.name,
        required this.age,
        required this.gender,
        required this.adres,
        required this.mobile,
        required this.advance,
        required this.roomtype,
        required this.roomno,
        required this.status,
    });

    int id;
    String ipno;
    String perid;
    String admitdate;
    String dischargedate;
    String doctorname;
    String name;
    String age;
    String gender;
    String adres;
    String mobile;
    String advance;
    String roomtype;
    String roomno;
    String status;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        ipno: json["ipno"],
        perid: json["perid"],
        admitdate: json["admitdate"],
        dischargedate: json["dischargedate"],
        doctorname: json["doctorname"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        adres: json["adres"],
        mobile: json["mobile"],
        advance: json["advance"],
        roomtype: json["roomtype"],
        roomno: json["roomno"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ipno": ipno,
        "perid": perid,
        "admitdate": admitdate,
        "dischargedate": dischargedate,
        "doctorname": doctorname,
        "name": name,
        "age": age,
        "gender": gender,
        "adres": adres,
        "mobile": mobile,
        "advance": advance,
        "roomtype": roomtype,
        "roomno": roomno,
        "status": status,
    };
}
