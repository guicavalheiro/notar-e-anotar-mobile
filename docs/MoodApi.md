# swagger.api.MoodApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://petstore.swagger.io/localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addMood**](MoodApi.md#addMood) | **POST** /mood | Add a mood
[**deleteMood**](MoodApi.md#deleteMood) | **DELETE** /mood/{id} | Deletes a mood
[**findMoodByID**](MoodApi.md#findMoodByID) | **GET** /mood/{id} | Finds mood by id
[**getAllMoods**](MoodApi.md#getAllMoods) | **GET** /mood | Returns all moods
[**updateMood**](MoodApi.md#updateMood) | **PUT** /mood/{id} | Update an existing mood


# **addMood**
> addMood(body)

Add a mood



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new MoodApi();
var body = new Mood(); // Mood | 

try { 
    api_instance.addMood(body);
} catch (e) {
    print("Exception when calling MoodApi->addMood: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Mood**](Mood.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **deleteMood**
> deleteMood(id)

Deletes a mood



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new MoodApi();
var id = id_example; // String | ID of mood to delete

try { 
    api_instance.deleteMood(id);
} catch (e) {
    print("Exception when calling MoodApi->deleteMood: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of mood to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **findMoodByID**
> Mood findMoodByID(id)

Finds mood by id



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new MoodApi();
var id = id_example; // String | ID of mood to return

try { 
    var result = api_instance.findMoodByID(id);
    print(result);
} catch (e) {
    print("Exception when calling MoodApi->findMoodByID: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of mood to return | 

### Return type

[**Mood**](Mood.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **getAllMoods**
> List<Mood> getAllMoods()

Returns all moods



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new MoodApi();

try { 
    var result = api_instance.getAllMoods();
    print(result);
} catch (e) {
    print("Exception when calling MoodApi->getAllMoods: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Mood>**](Mood.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

# **updateMood**
> Mood updateMood(id, body)

Update an existing mood



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new MoodApi();
var id = id_example; // String | ID of mood to update
var body = new Mood(); // Mood | 

try { 
    var result = api_instance.updateMood(id, body);
    print(result);
} catch (e) {
    print("Exception when calling MoodApi->updateMood: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of mood to update | 
 **body** | [**Mood**](Mood.md)|  | 

### Return type

[**Mood**](Mood.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](README.md#documentation-for-api-endpoints) [[Back to Model list]](README.md#documentation-for-models) [[Back to README]](README.md)

