part of swagger.api;

class AdditionalInfo {
  String name;
  int rating;

  AdditionalInfo({@required this.name, @required this.rating});

  @override
  String toString() {
    return 'AdditionalInfo[name=$name, rating=$rating, ]';
  }

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'].toString();
    rating = json['rating'] as int;
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'rating': rating};
  }

  static List<AdditionalInfo> listFromJson(List<dynamic> json) {
    return json.toList() == null
        ? new List<AdditionalInfo>()
        : json.map((value) => new AdditionalInfo.fromJson(value)).toList();
  }

  static Map<String, AdditionalInfo> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AdditionalInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new AdditionalInfo.fromJson(value));
    }
    return map;
  }
}
