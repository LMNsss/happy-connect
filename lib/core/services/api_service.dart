import 'package:dio/dio.dart';
import 'package:happy_connect/core/Models/login_request.dart';
import 'package:happy_connect/core/Models/login_response.dart';
import 'package:happy_connect/core/Models/user_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: '')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('staffs/info')
  Future<UserResponse> getStaffByEmail(@Query('email') String email);
}
