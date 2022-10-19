import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/assets.dart';
import '../controller/dark_theme_provider.dart';
import '../entities/user.entities.dart';
import '../services/services.dart';
import '../widgets/dark_mode_switch.dart';
import '../widgets/search_bar.dart';
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
    users = fetched.where((e) => e.name.toLowerCase().contains(value)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    final String bgImage = Provider.of<DarkThemeProvider>(context).bgImg;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // dismiss keyboard when user tap on the outside of textfield
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Container(
                width: w,
                height: h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: isLandscape ? w * 0.5 : w,
                  child: NestedScrollView(
                    headerSliverBuilder: (c, bo) => [
                      _buildLogoHeader(isDark),
                      _buildSearchBar(context),
                    ],
                    body: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListingFragment(data: users),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildLogoHeader(bool isDark) {
    return SliverToBoxAdapter(
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
    );
  }

  SliverAppBar _buildSearchBar(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      pinned: true,
      titleSpacing: 0,
      title: SearchBar(
        controller: controller,
        onChanged: search,
        onSearch: () {
          search(controller.value.text);
        },
      ),
    );
  }
}
