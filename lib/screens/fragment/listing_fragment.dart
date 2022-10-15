import 'package:flutter/material.dart';
import 'package:hacktoberfest/constants/assets.dart';
import 'package:provider/provider.dart';
import 'package:hacktoberfest/controller/dark_theme_provider.dart';
import 'package:hacktoberfest/widgets/grid_widget.dart';
import 'package:hacktoberfest/widgets/tap_effect.dart';
import '../../entities/user.entities.dart';
import '../detailed.screens.dart';

class ListingFragment extends StatelessWidget {
  final List<Users> data;
  const ListingFragment({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (data.isNotEmpty)
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridWidget(
            itemCount: data.length,
            builder: (BuildContext context, w, int i) {
              final Users user = data[i];
              return _Item(user: user, w: w);
            },
            crossCount: isLandscape ? 4 : 2,
          ),
        ),
      );
    else
      return Center(
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
  const _Item({
    Key? key,
    required this.user,
    required this.w,
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
            ),
          ),
        );
      },
      child: SizedBox(
        width: w,
        child: Column(
          children: [
            Container(
              height: w * 0.8,
              width: w * 0.8,
              decoration: BoxDecoration(
                color: isDark ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                'https://github.com/${user.name}.png',
                fit: BoxFit.cover,
                errorBuilder: ((context, error, stackTrace) =>
                    Image.asset(Assets.user)),
              ),
            ),
            SizedBox(height: 10),
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
