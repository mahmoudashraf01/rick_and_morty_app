class AppCharacters {
  late final int charId;
  late final String name;
  late final String gender;
  late final String species;
  late final String status;
  late final String image;
  late final Origin origin;
  late final Origin location;
  late final List<dynamic> episode;

  AppCharacters.fromJson(Map<String, dynamic> json) {
    charId = json['id'];
    name = json['name'];
    gender = json['gender'];
    status = json['status'];
    image = json['image'];
    origin = Origin.fromJson(json['origin']); // Create an Origin instance
    location = Origin.fromJson(json['location']);
    episode = json['episode'];
  }
}

class Origin {
  late final String name;
  late final String url;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
