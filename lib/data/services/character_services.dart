import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';

class CharacterServices {
  late Dio dio;

  CharacterServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data);
      print(response.statusCode);
      final responseData = response.data as Map<String, dynamic>;
      final charactersList = responseData['results']
          as List<dynamic>; // Assuming the data is in a 'results' key
      return charactersList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
