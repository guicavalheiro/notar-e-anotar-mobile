# swagger.api.TaskApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTask**](TaskApi.md#addTask) | **POST** /task | Add a task
[**deleteTask**](TaskApi.md#deleteTask) | **DELETE** /task/{id} | Deletes a task
[**findTaskByID**](TaskApi.md#findTaskByID) | **GET** /task/{id} | Finds task by id
[**getAllTask**](TaskApi.md#getAllTask) | **GET** /task | Returns all tasks
[**updateTask**](TaskApi.md#updateTask) | **PUT** /task/{id} | Update an existing task


# **addTask**
> addTask(body)

Add a task



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TaskApi();
var body = new Task(); // Task | 

try { 
    api_instance.addTask(body);
} catch (e) {
    print("Exception when calling TaskApi->addTask: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Task**](Task.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **deleteTask**
> deleteTask(id)

Deletes a task



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TaskApi();
var id = id_example; // String | ID of task to delete

try { 
    api_instance.deleteTask(id);
} catch (e) {
    print("Exception when calling TaskApi->deleteTask: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of task to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **findTaskByID**
> Task findTaskByID(id)

Finds task by id



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TaskApi();
var id = id_example; // String | ID of task to return

try { 
    var result = api_instance.findTaskByID(id);
    print(result);
} catch (e) {
    print("Exception when calling TaskApi->findTaskByID: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of task to return | 

### Return type

[**Task**](Task.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllTask**
> List<Task> getAllTask()

Returns all tasks



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TaskApi();

try { 
    var result = api_instance.getAllTask();
    print(result);
} catch (e) {
    print("Exception when calling TaskApi->getAllTask: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Task>**](Task.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **updateTask**
> Task updateTask(id, body)

Update an existing task



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TaskApi();
var id = id_example; // String | ID of task to update
var body = new Task(); // Task | 

try { 
    var result = api_instance.updateTask(id, body);
    print(result);
} catch (e) {
    print("Exception when calling TaskApi->updateTask: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of task to update | 
 **body** | [**Task**](Task.md)|  | 

### Return type

[**Task**](Task.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

