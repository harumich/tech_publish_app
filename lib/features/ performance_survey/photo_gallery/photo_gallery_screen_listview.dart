import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

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
            _Photo(
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

class _Photo extends StatelessWidget {
  const _Photo({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}

const _imageCount = 100;
