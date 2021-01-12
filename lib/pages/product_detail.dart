import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';

class ProductDetail extends StatelessWidget {
  // 画面を遷移するために必要なウィジェットの名前を定義する
  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    // 画面遷移する際に渡した引数が格納されている（後述）
    // この引数はObject型として扱われるので、明示的にProduct型を指定する必要がある
    final Product product = ModalRoute.of(context).settings.arguments;
    // 新しい画面を表示したいので、Scaffoldウィジェットを返す
    return Scaffold(
      appBar: AppBar(
        title: Text("商品詳細"),
      ),
      body: Container(
        child: Center(
          child: Text(
            // とりあえず商品名でも表示してみる
            product.title,
          ),
        ),
      ),
    );
  }
}
