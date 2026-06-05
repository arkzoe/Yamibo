import 'package:flutter/material.dart';

class SettingsPanel extends StatelessWidget {
  final double fontSize;
  final double lineHeight;
  final double letterSpacing;
  final double padding;
  final bool nightMode;
  final bool loadImages;
  final ValueChanged<double> onFontSizeChanged;
  final ValueChanged<double> onLineHeightChanged;
  final ValueChanged<double> onLetterSpacingChanged;
  final ValueChanged<double> onPaddingChanged;
  final VoidCallback onToggleNightMode;
  final ValueChanged<bool> onLoadImagesChanged;

  const SettingsPanel({
    super.key,
    required this.fontSize,
    required this.lineHeight,
    required this.letterSpacing,
    required this.padding,
    required this.nightMode,
    required this.loadImages,
    required this.onFontSizeChanged,
    required this.onLineHeightChanged,
    required this.onLetterSpacingChanged,
    required this.onPaddingChanged,
    required this.onToggleNightMode,
    required this.onLoadImagesChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fg = nightMode ? Colors.white : Colors.black87;
    final bg = nightMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Container(
      color: bg,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('阅读设置', style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: fg)),
          const SizedBox(height: 16),
          _buildSlider('字号', fontSize, 14, 32, 1, fg, onFontSizeChanged),
          _buildSlider('行高', lineHeight, 20, 44, 2, fg, onLineHeightChanged),
          _buildSlider('字间距', letterSpacing, 0, 4, 0.5, fg,
              onLetterSpacingChanged),
          _buildSlider('页边距', padding, 8, 32, 2, fg, onPaddingChanged),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('夜间模式', style: TextStyle(color: fg)),
              const Spacer(),
              Switch(
                value: nightMode,
                onChanged: (_) => onToggleNightMode(),
              ),
            ],
          ),
          Row(
            children: [
              Text('加载图片', style: TextStyle(color: fg)),
              const Spacer(),
              Switch(
                value: loadImages,
                onChanged: onLoadImagesChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(
    String label,
    double value,
    double min,
    double max,
    double step,
    Color fg,
    ValueChanged<double> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text(label, style: TextStyle(color: fg, fontSize: 14)),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              divisions: ((max - min) / step).round(),
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              value.toStringAsFixed(step < 1 ? 1 : 0),
              style: TextStyle(color: fg, fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
