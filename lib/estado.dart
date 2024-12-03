// ignore_for_file: unnecessary_getters_setters

import 'package:farma_app_v1/autenticador.dart';
import 'package:flutter/material.dart';

enum Situacao { mostrandoProdutos, mostrandoDetalhes }

class EstadoApp extends ChangeNotifier {
  Situacao _situacao = Situacao.mostrandoProdutos;
  Situacao get situacao => _situacao;

  late int _idProduto;
  int get idProduto => _idProduto;

  Usuario? _usuario;
  Usuario? get usuario => _usuario;
  set usuario(Usuario? usuario) {
    _usuario = usuario;
  }

  void mostrarProdutos() {
    _situacao = Situacao.mostrandoProdutos;

    notifyListeners();
  }

  void mostrarDetalhes(int idProduto) {
    _situacao = Situacao.mostrandoDetalhes;
    _idProduto = idProduto;

    notifyListeners();
  }

  void onLogin(Usuario usuario) {
    _usuario = usuario;

    notifyListeners();
  }

  void onLogout() {
    _usuario = null;

    notifyListeners();
  }
}

late EstadoApp estadoApp;
