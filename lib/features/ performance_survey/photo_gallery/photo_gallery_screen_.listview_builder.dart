import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tech_publish_app/features/%20performance_survey/photo_gallery/photo.dart';

/// ListView.builderで[Photo]の一覧を表示させた画像ギャラリー画面
/// ListView.builderは、無限スクロールのリストを実装する際に便利です
class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builderで実装'),
      ),
      body: ListView.builder(
        itemCount: _imageCount,
        // デフォルトで250.0のキャッシュ領域が確保されています(RenderAbstractViewport.defaultCacheExtent)
        // NOTE: 上下スクロールしても表示に詰まらないようにするために、画面に表示されている範囲の上下に10画像分のキャッシュを持たせる
        cacheExtent: _photoHeight * 10,
        itemBuilder: (context, index) {
          return Photo(
            height: _photoHeight,
            url: faker.image.image(
              keywords: ['nature', index.toString()],
              random: true,
            ),
          );
        },
      ),
    );
  }
}

const _imageCount = 100;
const double _photoHeight = 200;
