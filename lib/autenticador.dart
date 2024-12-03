// ignore_for_file: unnecessary_getters_setters
import 'package:google_sign_in/google_sign_in.dart';

class Usuario {
  String? _nome = "";
  String? get nome => _nome;
  set nome(String? nome) {
    _nome = nome;
  }

  String _email = "";
  String get email => _email;
  set email(String email) {
    _email = email;
  }

  Usuario(String? nome, String email) {
    _nome = nome;
    _email = email;
  }
}

class Autenticador {
  static Future<Usuario> login() async {
    final gUser = await GoogleSignIn().signIn();
    final usuario = Usuario(gUser!.displayName, gUser.email);

    return usuario;
  }

  static Future<Usuario?> recuperarUsuario() async {
    Usuario? usuario;

    final gSignIn = GoogleSignIn();
    if (await gSignIn.isSignedIn()) {
      await gSignIn.signInSilently();

      final gUser = gSignIn.currentUser;
      if (gUser != null) {
        usuario = Usuario(gUser.displayName, gUser.email);
      }
    }

    return usuario;
  }

  static Future<void> logout() async {
    await GoogleSignIn().signOut();
  }
}
