import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'LOG IN',
          'email': 'Mail',
          'password': 'Password',
          'clients': 'CLIENTS',
          'search': 'Search',
          'add_new': 'ADD NEW',
          'save': 'SAVE',
          'cancel': 'Cancel',
          'load_more': 'LOAD MORE',
          'mail_required': 'Mail is required',
          'password_required': 'Password is required',
          'leave': 'Leave',
          'leave_text': 'Are you sure to go out?',
        },
        'es_AR': {
          'login': 'INGRESAR',
          'email': 'Mail',
          'password': 'Contraseña',
          'clients': 'CLIENTES',
          'search': 'Buscar',
          'add_new': 'AGREGAR',
          'load_more': 'CARGAR MÁS',
          'mail_required': 'Mail obligatorio',
          'password_required': 'Password obligatorio',
          'leave': 'Salir',
          'leave_text': '¿Vas a salir de minimal?',
        }
      };
}
