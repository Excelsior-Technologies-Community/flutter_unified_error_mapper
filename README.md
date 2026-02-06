## 🚨 Flutter Unified Error Mapper

A lightweight Unified Error Mapping library for Flutter that converts API / network / runtime errors into clean, UI-friendly messages.

Designed to keep UI free from HTTP clients, try/catch chaos, and error parsing logic.

---

## ✨ Features

- 🔁 Single source of truth for errors

- 🌐 Maps API / network / runtime errors

- 🎯 Converts errors into UI-ready messages

- 🧩 Works with Dio, http, GraphQL, or any client

- 🚫 No BuildContext required

- 📦 Package-safe & reusable

- 🧪 Easy to test and extend

---
## Preview 

https://github.com/user-attachments/assets/0bee80a0-df97-42ba-b36d-435620580f7a

---
## 📦 Installation
Local package
```
dependencies:
  flutter_unified_error:
    git:
     path:https://github.com/Excelsior-Technologies-Communitye/flutter_unified_error_mapper.git
```
then run: 
```
flutter pub get
```

---
## 📁 Folder Structure
```
lib/
├── flutter_unified_error.dart
└── src/
    ├── error_mapper.dart
    ├── app_error.dart
    ├── api_error.dart
    ├── ui_error.dart
    └── error_codes.dart
```
---
## 🚀 Getting Started

### 1️⃣ Map any error (API / Network / Runtime)
```
try {
  await apiCall();
} catch (e) {
  throw ErrorMapper.map(e);
}
```
### 2️⃣ Convert domain error → UI error
```
catch (e) {
  if (e is AppError) {
    final uiError = ErrorMapper.toUi(e);
    showSnackbar(uiError.message);
  }
}
```
---
## 🌐 Supported Error Scenarios

| Scenario | Description | UI Message |
|--------|------------|------------|
| No Internet | Device has no network connection | Check your internet connection |
| Timeout | Request timed out | Request timed out. Try again |
| 401 Unauthorized | User is not authenticated | Please login again |
| 403 Forbidden | Access denied | You don’t have permission |
| 404 Not Found | Resource not found | Requested data not found |
| 409 Conflict | Duplicate or conflict request | Conflict occurred |
| 422 Validation Error | Invalid request data | Invalid input provided |
| 500 Server Error | Internal server failure | Server error. Try again later |
| 502 / 503 | Service unavailable | Service temporarily unavailable |
| Unknown Error | Unhandled exception | Something went wrong |

---
## 📄 License

MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this Flutter Image Compression library and associated documentation files
(the “Software”), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM,
OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
