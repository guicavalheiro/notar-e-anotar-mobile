part of swagger.api;

class WeeklyRoutine {
  String id;
  String routinePlanId;
  String subjectId;
  String year;
  int weekNumber;
  List<RoutineDay> days = [];

  WeeklyRoutine(
      {@required this.routinePlanId,
      @required this.subjectId,
      @required this.year,
      @required this.weekNumber,
      @required this.days}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'WeeklyRoutine[id=$id, routinePlanId=$routinePlanId, subjectId=$subjectId, year=$year, weekNumber=$weekNumber, days=$days, ]';
  }

  WeeklyRoutine.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    routinePlanId = json['routine_plan_id'];
    subjectId = json['subject_id'];
    year = json['year'];
    weekNumber = json['week_number'];
    days = RoutineDay.listFromJson(json['days']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'routine_plan_id': routinePlanId,
      'subject_id': subjectId,
      'year': year,
      'week_number': weekNumber,
      'days': days
    };
  }

  static List<WeeklyRoutine> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<WeeklyRoutine>()
        : json.map((value) => new WeeklyRoutine.fromJson(value)).toList();
  }

  static Map<String, WeeklyRoutine> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WeeklyRoutine>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new WeeklyRoutine.fromJson(value));
    }
    return map;
  }
}
