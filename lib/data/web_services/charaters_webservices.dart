import 'package:dio/dio.dart';
import 'package:film_character/constants/strings.dart';

class CharactersWebservice {
  late Dio dio;

  CharactersWebservice() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      connectTimeout: Duration(seconds: 60),
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getcharacters() async {
    try {
       Response response = await dio.get('character');
    print(response.data.toString());
    return response.data;
    } catch (e) {
      return {};
    }
   
  }
}
