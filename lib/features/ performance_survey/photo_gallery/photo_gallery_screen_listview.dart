import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tech_publish_app/features/%20performance_survey/photo_gallery/photo.dart';

/// ListViewで[Photo]の一覧を表示させた画像ギャラリー画面
///　ListViewは、リストの要素が固定されている場合に便利です
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewで実装'),
      ),
      body: ListView(
        // デフォルトで250.0のキャッシュ領域が確保されています(RenderAbstractViewport.defaultCacheExtent)
        // cacheExtent: 250,
        children: [
          for (var i = 0; i < _imageCount; i++)
            Photo(
              height: _photoHeight,
              url: faker.image.image(
                keywords: ['nature', i.toString()],
                random: true,
              ),
            ),
        ],
      ),
    );
  }
}

const _imageCount = 100;
const double _photoHeight = 200;
