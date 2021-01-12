import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';
import 'package:flutter_hands_on/pages/product_detail.dart';

// StatelessWidgetを継承
class ProductCard extends StatelessWidget {
  final Product product;

  // コンストラクタでProductを受け取り、フィールドに格納
  // {}はoptional named parameterと呼ばれるもので、this.productはフィールドにセットするためのシンタックスシュガーです
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Navigator.of(context).pushNamedで遷移を実行する
        // 第一引数はルーティング名、argumentsはoptionalでパラメータを渡せる
        // ProductDetailで書いた通り、遷移先のウィジェットでは、
        // ModalRoute.of(context).settings.arguments でこの引数が取得できる
        Navigator.of(context).pushNamed(
          ProductDetail.routeName,
          arguments: this.product,
        );
      },
      // Container自体は変更不要
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.network(product.sampleImageUrl),
            SizedBox(
              height: 40,
              child: Text(product.title),
            ),
            Text("${product.price.toString()}円"),
          ],
        ),
      ),
    );
  }
}
