import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'LOG IN',
          'email': 'Mail',
          'password': 'Password',
        },
        'es_AR': {
          'login': 'INGRESAR',
          'email': 'Mail',
          'password': 'Contraseña',
        }
      };
}
