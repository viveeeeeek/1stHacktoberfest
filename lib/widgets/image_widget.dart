import 'package:flutter/material.dart';
import 'package:hacktoberfest/constants/assets.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final double radius;

  const ImageWidget(this.imageUrl,
      {Key? key, this.height, this.width, this.radius = 16})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isDark ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: (imageUrl == null || imageUrl == "")
            ? Image.asset(
                Assets.user,
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset(Assets.user),
              ),
      ),
    );
  }
}
