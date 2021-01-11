import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hands_on/models/product.dart';
import 'package:flutter_hands_on/requests/product_request.dart';

// httpライブラリを'http'という名前でimportする
import 'package:http/http.dart' as http;

class ProductListStore extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  fetchNextProducts() async {
    if (_isFetching) {
      return;
    }
    _isFetching = true;

    final request = ProductRequest(
      client: http.Client(),
      offset: _products.length,
    );

    final products = await request.fetch().catchError((e) {
      _isFetching = false;
    });
    _products.addAll(products);
    _isFetching = false;
    notifyListeners();
  }
}

// main()はFlutterアプリケーションのエントリポイントです
// main()の中で、runAppにルートとなるウィジェットを格納して呼ぶ必要があります
void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUZURI"),
      ),
      // bodyで表示したいウィジェットを別のメソッドに切り出す
      body: _productsList(context),
    );
  }

  // Widgetを返すメソッド
  // 引数はBuildContextで、呼び出し側のbuildで持っているものを渡す

  Widget _productsList(BuildContext context) {
    return Container(
      // GrideViewはウィジェットをグリッドで表示してくれるウィジェット
      // IOS UIKitでいうところの UICollectionView
      // GridView.builderというfactory(カスタムコンストラクタ)初期化する
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // グリッド横方向のウィジェット数
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          // グリッド表示するウィジェットの縦横比
          childAspectRatio: 0.7,
        ),
        // グリッドに表示したいウィジェット数
        itemCount: 6,
        // itemBuilderはGridViewのインデックス毎に表示したいウィジェットを返すデリゲート
        // context, indexを引数にとり、ウィジェットを返す関数を指定してやる
        // itemContの回数だけ呼ばれる、この例では6回
        itemBuilder: (context, index) {
          // グレーのコンテナを表示
          return Container(
            color: Colors.grey,
            margin: EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
