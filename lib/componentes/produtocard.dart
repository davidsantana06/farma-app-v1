import 'package:farma_app_v1/estado.dart';
import 'package:flutter/material.dart';

class ProdutoCard extends StatelessWidget {
  final dynamic produto;

  const ProdutoCard({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        estadoApp.mostrarDetalhes(produto["_id"]);
      },
      child: Card(
        child: Column(children: [
          Image.asset("lib/recursos/imagens/produto.jpeg"),
          Row(children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset("lib/recursos/imagens/avatar.png")),
            Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(produto["company"]["name"],
                    style: const TextStyle(fontSize: 15))),
          ]),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(produto["product"]["name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16))),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
              child: Text(produto["product"]["description"])),
          const Spacer(),
          Row(children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Text("R\$ ${produto['product']['price'].toString()}"))
          ])
        ]),
      ),
    );
  }
}
