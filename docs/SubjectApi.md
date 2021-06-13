# swagger.api.SubjectApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findSubjectByName**](SubjectApi.md#findSubjectByName) | **GET** /subject/{name} | Finds subject by name
[**getAllSubjects**](SubjectApi.md#getAllSubjects) | **GET** /subject | Returns all subjects


# **findSubjectByName**
> Subject findSubjectByName(name)

Finds subject by name



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new SubjectApi();
var name = name_example; // String | Name of subject to return

try { 
    var result = api_instance.findSubjectByName(name);
    print(result);
} catch (e) {
    print("Exception when calling SubjectApi->findSubjectByName: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of subject to return | 

### Return type

[**Subject**](Subject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllSubjects**
> List<Subject> getAllSubjects()

Returns all subjects



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new SubjectApi();

try { 
    var result = api_instance.getAllSubjects();
    print(result);
} catch (e) {
    print("Exception when calling SubjectApi->getAllSubjects: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Subject>**](Subject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

