import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

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
              _Photo(
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
