# swagger.api.RoutineDataApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addRoutineData**](RoutineDataApi.md#addRoutineData) | **POST** /routine_data | Add a routine data
[**deleteRoutineData**](RoutineDataApi.md#deleteRoutineData) | **DELETE** /routine_data/{id} | Deletes a routine data
[**findRoutineDataByID**](RoutineDataApi.md#findRoutineDataByID) | **GET** /routine_data/{id} | Finds routine data by id
[**getAllRoutineData**](RoutineDataApi.md#getAllRoutineData) | **GET** /routine_data | Returns all routines data
[**updateRoutineData**](RoutineDataApi.md#updateRoutineData) | **PUT** /routine_data/{id} | Update an existing routine data


# **addRoutineData**
> addRoutineData(body)

Add a routine data



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDataApi();
var body = new RoutineData(); // RoutineData | 

try { 
    api_instance.addRoutineData(body);
} catch (e) {
    print("Exception when calling RoutineDataApi->addRoutineData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RoutineData**](RoutineData.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **deleteRoutineData**
> deleteRoutineData(id)

Deletes a routine data



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDataApi();
var id = id_example; // String | ID of routine data to delete

try { 
    api_instance.deleteRoutineData(id);
} catch (e) {
    print("Exception when calling RoutineDataApi->deleteRoutineData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine data to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **findRoutineDataByID**
> RoutineData findRoutineDataByID(id)

Finds routine data by id



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDataApi();
var id = id_example; // String | ID of routine data to return

try { 
    var result = api_instance.findRoutineDataByID(id);
    print(result);
} catch (e) {
    print("Exception when calling RoutineDataApi->findRoutineDataByID: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine data to return | 

### Return type

[**RoutineData**](RoutineData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllRoutineData**
> List<RoutineData> getAllRoutineData()

Returns all routines data



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDataApi();

try { 
    var result = api_instance.getAllRoutineData();
    print(result);
} catch (e) {
    print("Exception when calling RoutineDataApi->getAllRoutineData: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<RoutineData>**](RoutineData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **updateRoutineData**
> RoutineData updateRoutineData(id, body)

Update an existing routine data



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutineDataApi();
var id = id_example; // String | ID of routine data to update
var body = new RoutineData(); // RoutineData | 

try { 
    var result = api_instance.updateRoutineData(id, body);
    print(result);
} catch (e) {
    print("Exception when calling RoutineDataApi->updateRoutineData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine data to update | 
 **body** | [**RoutineData**](RoutineData.md)|  | 

### Return type

[**RoutineData**](RoutineData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

