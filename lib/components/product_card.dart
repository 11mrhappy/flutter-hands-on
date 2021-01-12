import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';

// StatelessWidgetを継承
class ProductCard extends StatelessWidget {
  final Product product;

  // コンストラクタでProductを受け取り、フィールドに格納
  // {}はoptional named parameterと呼ばれるもので、this.productはフィールドにセットするためのシンタックスシュガーです
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    // ContainerをGestureDetectorでラップする
    return GestureDetector(
      // onTapは、childウィジェットがタップされたら発火する
      onTap: () async {
        print("tapped");
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
