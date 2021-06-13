# swagger.api.WeeklyRoutineApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addWeeklyRoutine**](WeeklyRoutineApi.md#addWeeklyRoutine) | **POST** /weekly_routine | Add a weekly routine
[**deleteWeeklyRoutine**](WeeklyRoutineApi.md#deleteWeeklyRoutine) | **DELETE** /weekly_routine/{id} | Deletes a weekly routine
[**findWeeklyRoutineByID**](WeeklyRoutineApi.md#findWeeklyRoutineByID) | **GET** /weekly_routine/{id} | Finds weekly routine by id
[**getAllWeeklyRoutine**](WeeklyRoutineApi.md#getAllWeeklyRoutine) | **GET** /weekly_routine | Returns all weekly routines
[**updateWeeklyRoutine**](WeeklyRoutineApi.md#updateWeeklyRoutine) | **PUT** /weekly_routine/{id} | Update an existing weekly routine


# **addWeeklyRoutine**
> addWeeklyRoutine(body)

Add a weekly routine



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new WeeklyRoutineApi();
var body = new WeeklyRoutine(); // WeeklyRoutine | 

try { 
    api_instance.addWeeklyRoutine(body);
} catch (e) {
    print("Exception when calling WeeklyRoutineApi->addWeeklyRoutine: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**WeeklyRoutine**](WeeklyRoutine.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **deleteWeeklyRoutine**
> deleteWeeklyRoutine(id)

Deletes a weekly routine



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new WeeklyRoutineApi();
var id = id_example; // String | ID of weekly routine to delete

try { 
    api_instance.deleteWeeklyRoutine(id);
} catch (e) {
    print("Exception when calling WeeklyRoutineApi->deleteWeeklyRoutine: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of weekly routine to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **findWeeklyRoutineByID**
> WeeklyRoutine findWeeklyRoutineByID(id)

Finds weekly routine by id



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new WeeklyRoutineApi();
var id = id_example; // String | ID of weekly routine to return

try { 
    var result = api_instance.findWeeklyRoutineByID(id);
    print(result);
} catch (e) {
    print("Exception when calling WeeklyRoutineApi->findWeeklyRoutineByID: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of weekly routine to return | 

### Return type

[**WeeklyRoutine**](WeeklyRoutine.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllWeeklyRoutine**
> List<WeeklyRoutine> getAllWeeklyRoutine()

Returns all weekly routines



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new WeeklyRoutineApi();

try { 
    var result = api_instance.getAllWeeklyRoutine();
    print(result);
} catch (e) {
    print("Exception when calling WeeklyRoutineApi->getAllWeeklyRoutine: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<WeeklyRoutine>**](WeeklyRoutine.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **updateWeeklyRoutine**
> WeeklyRoutine updateWeeklyRoutine(id, body)

Update an existing weekly routine



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new WeeklyRoutineApi();
var id = id_example; // String | ID of weekly routine to update
var body = new WeeklyRoutine(); // WeeklyRoutine | 

try { 
    var result = api_instance.updateWeeklyRoutine(id, body);
    print(result);
} catch (e) {
    print("Exception when calling WeeklyRoutineApi->updateWeeklyRoutine: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of weekly routine to update | 
 **body** | [**WeeklyRoutine**](WeeklyRoutine.md)|  | 

### Return type

[**WeeklyRoutine**](WeeklyRoutine.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

