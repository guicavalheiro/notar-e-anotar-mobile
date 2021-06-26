library swagger.api;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:objectid/objectid.dart';

part '../models/additional_info.dart';
part '../models/mood.dart';
part '../models/routine_data.dart';
part '../models/routine_day.dart';
part '../models/routine_plan.dart';
part '../models/subject.dart';
part '../models/task.dart';
part '../models/user.dart';
part '../models/weekly_routine.dart';
part 'api/mood_api.dart';
part 'api/routine_data_api.dart';
part 'api/routine_day_api.dart';
part 'api/routine_plan_api.dart';
part 'api/subject_api.dart';
part 'api/task_api.dart';
part 'api/weekly_routine_api.dart';
part 'api_client.dart';
part 'api_exception.dart';
part 'api_helper.dart';
part 'auth/api_key_auth.dart';
part 'auth/authentication.dart';
part 'auth/http_basic_auth.dart';
part 'auth/oauth.dart';

ApiClient defaultApiClient = new ApiClient();
