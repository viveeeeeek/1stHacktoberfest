import 'package:flutter/material.dart';
import 'package:hacktoberfest/entities/user.entities.dart';
import 'package:hacktoberfest/services/services.dart';
import 'package:hacktoberfest/widgets/dark_mode_switch.dart';
import 'package:hacktoberfest/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import '../constants/assets.dart';
import '../controller/dark_theme_provider.dart';
import 'fragment/listing_fragment.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late bool isLoading;
  late List<Users> fetched;
  late List<Users> users;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    users = [];
    controller = TextEditingController();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: isLandscape ? w * 0.5 : w,
            child: NestedScrollView(
              headerSliverBuilder: (c, bo) => [
                SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          // constraints: BoxConstraints.expand(),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            isDark ? Assets.banner_dark : Assets.banner,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      DarkModeSwitch(),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  titleSpacing: 0,
                  title: SearchBar(
                    controller: controller,
                    onChanged: search,
                    onSearch: () {
                      search(controller.value.text);
                    },
                  ),
                ),
              ],
              body: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListingFragment(data: users),
            ),
          ),
        ),
      ),
    );
  }

  void fetchUsers() {
    isLoading = true;
    Services.getUsers().then((users) {
      setState(() {
        fetched = users;
        this.users = fetched;
        isLoading = false;
      });
    });
  }

  void search(String value) {
    setState(() {
      users =
          fetched.where((e) => e.name.toLowerCase().contains(value)).toList();
    });
  }
}
