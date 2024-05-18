import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tech_publish_app/features/%20performance_survey/photo_gallery/photo.dart';

/// Columnで[Photo]の一覧を表示させた画像ギャラリー画面
/// Columnは、スクロールしないリストを実装する際に便利です
/// 画像が多い場合は、SingleChildScrollViewとColumnで実装すると、
/// 一気に画像を取得するため、最初の表示までに時間がかかる & メモリを大量に消費する可能性があります
class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollViewとColumnで実装'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}

const _imageCount = 100;
const double _photoHeight = 200;
