import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

const double _photoHeight = 200;

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
        // 画面に表示されている範囲の上下に10画像分のキャッシュを持たせる
        cacheExtent: _photoHeight * 10,
        itemBuilder: (context, index) {
          return _Photo(
            index: index,
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

class _Photo extends StatelessWidget {
  const _Photo({
    required this.index,
    required this.url,
  });

  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      height: _photoHeight,
      fit: BoxFit.cover,
    );
  }
}

const _imageCount = 100;
