import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tech_publish_app/features/%20performance_survey/photo_gallery/photo_gallery_screen_.listview_builder.dart';
import 'package:tech_publish_app/features/%20performance_survey/photo_gallery/photo_gallery_screen_column.dart';
import 'package:tech_publish_app/features/%20performance_survey/photo_gallery/photo_gallery_screen_listview.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            _SectionTile(
              title: '画像ギャラリー画面',
              tiles: [
                ListTile(
                  title: const Text('SingleChildScrollViewとColumnで実装'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ColumnScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('ListViewで実装したパターン'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ListViewScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('ListView.builderで実装したパターン'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ListViewBuilderScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTile extends HookWidget {
  const _SectionTile({
    required this.title,
    required this.tiles,
  });

  final String title;
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    final isOpen = useState(false);
    return ExpansionTile(
      title: Text(title),
      initiallyExpanded: isOpen.value,
      onExpansionChanged: (value) => isOpen.value = value,
      children: tiles,
    );
  }
}
