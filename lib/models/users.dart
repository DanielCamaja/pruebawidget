class Users {
  final int userID;
  final String name;
  final String username;
  final String email;
  final Address address;

  Users(
      {required this.userID,
      required this.name,
      required this.username,
      required this.email,
      required this.address});
  static List<Users> fromJsonList(List list) {
    return list.map((item) => Users.fromJson(item)).toList();
  }

  factory Users.fromJson(Map<String, dynamic> usersjson) => Users(
      userID: usersjson["id"],
      name: usersjson["name"],
      username: usersjson["username"],
      email: usersjson["email"],
      address: Address.fromJson(usersjson["address"]));
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> addjson) {
    return Address(
        street: addjson["street"],
        suite: addjson["suite"],
        city: addjson["city"],
        zipcode: addjson["zipcode"]);
  }
}
