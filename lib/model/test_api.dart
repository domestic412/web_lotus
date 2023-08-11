class TestAPI {
  String id;
  String name;
  String email;

  TestAPI({
    required this.id,
    required this.name,
    required this.email,});

  factory TestAPI.fromJson(Map<String, dynamic> json) {
    return TestAPI(
    id: json['vessel'],
    name: json['voyage'],
    email: json['logStatus'],
    );
  }
}