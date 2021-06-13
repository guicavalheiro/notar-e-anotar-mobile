# swagger.api.RoutinePlanApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addRoutinePlan**](RoutinePlanApi.md#addRoutinePlan) | **POST** /routine_plan | Add a routine plan
[**deleteRoutinePlan**](RoutinePlanApi.md#deleteRoutinePlan) | **DELETE** /routine_plan/{id} | Deletes a routine plan
[**findRoutinePlanByID**](RoutinePlanApi.md#findRoutinePlanByID) | **GET** /routine_plan/{id} | Finds routine plan by id
[**getAllRoutinePlan**](RoutinePlanApi.md#getAllRoutinePlan) | **GET** /routine_plan | Returns all routine plans
[**updateRoutinePlan**](RoutinePlanApi.md#updateRoutinePlan) | **PUT** /routine_plan/{id} | Update an existing routine plan


# **addRoutinePlan**
> addRoutinePlan(body)

Add a routine plan



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutinePlanApi();
var body = new RoutinePlan(); // RoutinePlan | 

try { 
    api_instance.addRoutinePlan(body);
} catch (e) {
    print("Exception when calling RoutinePlanApi->addRoutinePlan: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RoutinePlan**](RoutinePlan.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **deleteRoutinePlan**
> deleteRoutinePlan(id)

Deletes a routine plan



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutinePlanApi();
var id = id_example; // String | ID of routine plan to delete

try { 
    api_instance.deleteRoutinePlan(id);
} catch (e) {
    print("Exception when calling RoutinePlanApi->deleteRoutinePlan: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine plan to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **findRoutinePlanByID**
> RoutinePlan findRoutinePlanByID(id)

Finds routine plan by id



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutinePlanApi();
var id = id_example; // String | ID of routine plan to return

try { 
    var result = api_instance.findRoutinePlanByID(id);
    print(result);
} catch (e) {
    print("Exception when calling RoutinePlanApi->findRoutinePlanByID: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine plan to return | 

### Return type

[**RoutinePlan**](RoutinePlan.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllRoutinePlan**
> List<RoutinePlan> getAllRoutinePlan()

Returns all routine plans



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutinePlanApi();

try { 
    var result = api_instance.getAllRoutinePlan();
    print(result);
} catch (e) {
    print("Exception when calling RoutinePlanApi->getAllRoutinePlan: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<RoutinePlan>**](RoutinePlan.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **updateRoutinePlan**
> RoutinePlan updateRoutinePlan(id, body)

Update an existing routine plan



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new RoutinePlanApi();
var id = id_example; // String | ID of routine plan to update
var body = new RoutinePlan(); // RoutinePlan | 

try { 
    var result = api_instance.updateRoutinePlan(id, body);
    print(result);
} catch (e) {
    print("Exception when calling RoutinePlanApi->updateRoutinePlan: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of routine plan to update | 
 **body** | [**RoutinePlan**](RoutinePlan.md)|  | 

### Return type

[**RoutinePlan**](RoutinePlan.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

