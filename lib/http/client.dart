import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:salaryfits_posts/http/interceptor.dart';

//Interceptador que pega e envia os dados para a API.
final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 10),
);
