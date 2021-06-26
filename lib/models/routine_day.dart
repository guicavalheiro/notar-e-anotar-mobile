part of swagger.api;

class RoutineDay {
  String id;
  DateTime date;
  List<Task> chores = [];
  List<RoutineData> routineDate = [];

  RoutineDay(
      {@required this.date,
      @required this.chores,
      @required this.routineDate}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'RoutineDay[id=$id, date=$date, chores=$chores, routineDate=$routineDate, ]';
  }

  RoutineDay.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    date = new DateTime.fromMillisecondsSinceEpoch(json['date']);
    chores = Task.listFromJson(json['chores']);
    routineDate = RoutineData.listFromJson(json['routine_date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'chores': chores,
      'routine_date': routineDate
    };
  }

  static List<RoutineDay> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<RoutineDay>()
        : json.map((value) => new RoutineDay.fromJson(value)).toList();
  }

  static Map<String, RoutineDay> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RoutineDay>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RoutineDay.fromJson(value));
    }
    return map;
  }
}
