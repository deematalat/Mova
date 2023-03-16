 


# Movies App 🎬

Hi, do you like movies? 

#Flutter 3.7.3
#dart 2.19.2

# Features
-Browse popular movies
-Search for movies
-View movie details including synopsis, rating, and release date
-Watch movie trailers
-Mark movies as favorites
-View favorite movies offline

## Operating Principle
 The app sends requests and receives responses from the themoviedb API. <br> To learn more about `APIs` ,
 `Firebase` to access the app .

## Dependencies
- `Sizer`: <a target="_blank" href="https://pub.dev/packages/sizer">https://pub.dev/packages/sizer</a>
- `Flutter Spinkit`: <a target="_blank" href="https://pub.dev/packages/flutter_spinkit">https://pub.dev/packages/flutter_spinkit</a>
- `Cached Network Image`: <a target="_blank" href="https://pub.dev/packages/cached_network_image">https://pub.dev/packages/cached_network_image</a>
- `Fluttertoast`: <a target="_blank" href="https://pub.dev/packages/fluttertoast">https://pub.dev/packages/fluttertoast</a>
- `Http`: <a target="_blank" href="https://pub.dev/packages/http">https://pub.dev/packages/http</a>
- `Path Provider`: <a target="_blank" href="https://pub.dev/packages/path_provider">https://pub.dev/packages/path_provider</a>
- `firebase_auth`: <a target="_blank" href="https://pub.dev/packages/firebase_auth">https://pub.dev/packages/firebase_auth</a>
- `google_sign_in`: <a target="_blank" href="https://pub.dev/packages/google_sign_in">https://pub.dev/packages/google_sign_in</a>
- `firebase_core`:<a target="_blank" href="https://pub.dev/packages/firebase_core">https://pub.dev/packages/firebase_core</a>
 
## API Reference
TMDB API
- go to `secret/the_moviedb_api.dart`
- you will see the code like this

```dart
const String themoviedbApi = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
```
- replace the all `xx..` to your API, like this

```dart
const String themoviedbApi = 'your_api_code_here';
```
Contributing
Contributions are always welcome! If you have any ideas or suggestions, feel free to create an issue or a pull request.

License
This project is licensed under the MIT License - see the LICENSE file for details.
