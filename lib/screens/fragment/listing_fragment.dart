import 'package:flutter/material.dart';
import 'package:hacktoberfest/utils/extension.dart';
import 'package:hacktoberfest/utils/responsive_size.dart';
import 'package:hacktoberfest/widgets/image_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../controller/dark_theme_provider.dart';
import '../../entities/user.entities.dart';
import '../../widgets/grid_widget.dart';
import '../../widgets/tap_effect.dart';
import '../detailed.screens.dart';

class ListingFragment extends StatelessWidget {
  final List<Users> data;
  const ListingFragment({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridWidget(
                itemCount: data.length,
                builder: (BuildContext context, w, int i) {
                  final Users user = data[i];
                  return _Item(user: user, w: w, index: i);
                },
                crossCount: ResponsiveSize.isDesktop(context)
                    ? 6
                    : ResponsiveSize.isTablet(context)
                        ? 4
                        : 2,
              ),
            ),
          )
        : Center(
            child: Image.asset(
              Assets.noSearchFound,
              height: 200,
            ),
          );
  }
}

class _Item extends StatelessWidget {
  final Users user;
  final double w;
  final int index;
  const _Item({
    Key? key,
    required this.user,
    required this.w,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    return TapEffect(
      onClick: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              name: user.name,
              description: user.description,
              index: index,
            ),
          ),
        );
      },
      child: SizedBox(
        width: w,
        child: Column(
          children: [
            Hero(
              tag: "user_image_$index",
              child: ImageWidget(
                'https://github.com/${user.name.toGithubUsername()}.png',
                height: w * 0.8,
                width: w * 0.8,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
