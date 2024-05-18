import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DebugScreen(),
    );
  }
}

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
              title: 'Section 1',
              tiles: [
                ListTile(
                  title: const Text(
                      'ListViewとListView.builderとSingleChildScrollViewでラップされたColumnで動作比較とメリットデメリット'),
                  onTap: () {
                    // TODO: 画面遷移
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

class _SectionTile extends StatelessWidget {
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
