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
    return Container(
      margin: EdgeInsets.all(16),
      // Columnはウィジェットを縦に積むことができるウィジェット
      child: Column(
        // childrenにはList<Widget>を渡す
        // 上から表示したい順にウィジェットを配置する
        children: <Widget>[
          Image.network(product.sampleImageUrl),
          // SizedBoxはウィジェットのサイズを固定するためのウィジェット
          // heightやwidthを指定すると、childのウィジェットのサイズがその通りになる便利なウィジェット
          SizedBox(
            height: 40,
            // Product.titleは商品名を表す
            child: Text(product.title),
          ),
          // Product.priceにはその商品の金額が格納されている
          Text("${product.price.toString()}円"),
        ],
      ),
    );
  }
}
