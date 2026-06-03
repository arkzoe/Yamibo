import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_provider.dart';
import '../../../shared/providers/global_provider.dart';
import '../../../shared/theme/app_theme.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readerConfigAsync = ref.watch(settingsProvider);
    final themeModeAsync = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final readerConfig = readerConfigAsync.asData?.value ?? const ReaderConfigState();
    final themeMode = themeModeAsync.asData?.value ?? AppThemeMode.light;

    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          const _SectionHeader(title: '主题'),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: AppThemeMode.values.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final mode = AppThemeMode.values[index];
                final isSelected = mode == themeMode;
                return _ThemeCard(
                  mode: mode,
                  isSelected: isSelected,
                  onTap: () => themeNotifier.setTheme(mode),
                );
              },
            ),
          ),
          const Divider(),
          const _SectionHeader(title: '阅读设置'),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text('字号'),
            subtitle: Text('${readerConfig.fontSize.toInt()} sp'),
            trailing: SizedBox(
              width: 160,
              child: Slider(
                value: readerConfig.fontSize,
                min: 12,
                max: 32,
                divisions: 20,
                label: '${readerConfig.fontSize.toInt()}',
                onChanged: (v) => ref.read(settingsProvider.notifier).setFontSize(v),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.line_weight),
            title: const Text('行高'),
            subtitle: Text('${readerConfig.lineHeight.toInt()} sp'),
            trailing: SizedBox(
              width: 160,
              child: Slider(
                value: readerConfig.lineHeight,
                min: 18,
                max: 48,
                divisions: 15,
                label: '${readerConfig.lineHeight.toInt()}',
                onChanged: (v) => ref.read(settingsProvider.notifier).setLineHeight(v),
              ),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.image),
            title: const Text('加载图片'),
            value: readerConfig.loadImages,
            onChanged: (v) => ref.read(settingsProvider.notifier).setLoadImages(v),
          ),
          const Divider(),
          const _SectionHeader(title: '关于'),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('版本'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final AppThemeMode mode;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeCard({
    required this.mode,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getTheme(mode);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.withValues(alpha: 0.3),
            width: isSelected ? 2.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppTheme.getThemeIcon(mode),
              color: theme.colorScheme.onSurface,
              size: 20,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                AppTheme.getThemeName(mode),
                style: TextStyle(
                  fontSize: 10,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
