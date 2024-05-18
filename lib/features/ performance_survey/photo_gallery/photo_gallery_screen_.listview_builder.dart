import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

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
        itemBuilder: (context, index) {
          return _Photo(
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
