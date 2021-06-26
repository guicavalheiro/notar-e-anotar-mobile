part of swagger.api;

class Task {
  String id;
  String name;
  String description;
  int parentRating;
  int childrenRating;
  bool challenge;

  Task(
      {@required this.name,
      @required this.challenge,
      this.description,
      this.parentRating,
      this.childrenRating}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'Task[id=$id, name=$name, description=$description, parentRating=$parentRating, childrenRating=$childrenRating, challenge=$challenge, ]';
  }

  Task.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parentRating = json['parent_rating'];
    childrenRating = json['children_rating'];
    challenge = json['challenge'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'parent_rating': parentRating,
      'children_rating': childrenRating,
      'challenge': challenge
    };
  }

  static List<Task> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<Task>()
        : json.map((value) => new Task.fromJson(value)).toList();
  }

  static Map<String, Task> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Task>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Task.fromJson(value));
    }
    return map;
  }
}
