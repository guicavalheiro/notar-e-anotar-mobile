# swagger.api.RoutineDayApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addRoutineDay**](RoutineDayApi.md#addRoutineDay) | **POST** /routine_day | Add a routine day
[**deleteRoutineDay**](RoutineDayApi.md#deleteRoutineDay) | **DELETE** /routine_day/{id} | Deletes a routine day
[**findRoutineDayByID**](RoutineDayApi.md#findRoutineDayByID) | **GET** /routine_day/{id} | Finds routine day by id
[**getAllRoutineDay**](RoutineDayApi.md#getAllRoutineDay) | **GET** /routine_day | Returns all routine days
[**updateRoutineDay**](RoutineDayApi.md#updateRoutineDay) | **PUT** /routine_day/{id} | Update an existing routine day


# **addRoutineDay**
> addRoutineDay(body)

Add a routine day



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDayApi();
var body = new RoutineDay(); // RoutineDay | 

try { 
    api_instance.addRoutineDay(body);
} catch (e) {
    print("Exception when calling RoutineDayApi->addRoutineDay: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RoutineDay**](RoutineDay.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **deleteRoutineDay**
> deleteRoutineDay(id)

Deletes a routine day



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDayApi();
var id = id_example; // String | ID of routine day to delete

try { 
    api_instance.deleteRoutineDay(id);
} catch (e) {
    print("Exception when calling RoutineDayApi->deleteRoutineDay: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine day to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **findRoutineDayByID**
> RoutineDay findRoutineDayByID(id)

Finds routine day by id



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDayApi();
var id = id_example; // String | ID of routine day to return

try { 
    var result = api_instance.findRoutineDayByID(id);
    print(result);
} catch (e) {
    print("Exception when calling RoutineDayApi->findRoutineDayByID: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine day to return | 

### Return type

[**RoutineDay**](RoutineDay.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllRoutineDay**
> List<RoutineDay> getAllRoutineDay()

Returns all routine days



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDayApi();

try { 
    var result = api_instance.getAllRoutineDay();
    print(result);
} catch (e) {
    print("Exception when calling RoutineDayApi->getAllRoutineDay: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<RoutineDay>**](RoutineDay.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **updateRoutineDay**
> RoutineDay updateRoutineDay(id, body)

Update an existing routine day



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDayApi();
var id = id_example; // String | ID of routine day to update
var body = new RoutineDay(); // RoutineDay | 

try { 
    var result = api_instance.updateRoutineDay(id, body);
    print(result);
} catch (e) {
    print("Exception when calling RoutineDayApi->updateRoutineDay: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine day to update | 
 **body** | [**RoutineDay**](RoutineDay.md)|  | 

### Return type

[**RoutineDay**](RoutineDay.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

