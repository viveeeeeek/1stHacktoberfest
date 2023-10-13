import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktoberfest/utils/responsive_size.dart';
import 'package:provider/provider.dart';
import '../constants/assets.dart';
import '../controller/dark_theme_provider.dart';
import '../entities/user.entities.dart';
import '../services/services.dart';
import '../widgets/dark_mode_switch.dart';
import '../widgets/search_bar.dart';
import 'fragment/listing_fragment.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  List<Users> fetched = [];
  List<Users> users = [];
  TextEditingController controller = TextEditingController();
  final ScrollController _sliverScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() {
    setState(() {
      isLoading = true;
    });

    Services.getUsers().then((usersFromService) {
      setState(() {
        fetched = usersFromService;
        users = fetched;
        isLoading = false;
      });
    });
  }

  void search(String value) {
    setState(() {
      users = fetched.where((e) => e.name.toLowerCase().contains(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    final String bgImage = Provider.of<DarkThemeProvider>(context).bgImg;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: SafeArea(
            top: false,
            bottom: false,
            child: Stack(
              children: [
                Container(
                  width: ResponsiveSize.sizeWidth(context),
                  height: ResponsiveSize.sizeHeight(context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bgImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Scrollbar(
                  thumbVisibility: kIsWeb ? true : false,
                  controller: _sliverScrollController,
                  child: Center(
                    child: SizedBox(
                      width: isLandscape
                          ? ResponsiveSize.sizeWidth(context) * 0.9
                          : ResponsiveSize.sizeWidth(context),
                      child: NestedScrollView(
                        controller: _sliverScrollController,
                        headerSliverBuilder: (c, bo) => [
                          _buildLogoHeader(isDark),
                          _buildSearchBar(context),
                        ],
                        body: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListingFragment(data: users),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildLogoHeader(bool isDark) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: isLandscape ? 0 : 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  isDark ? Assets.bannerDark : Assets.banner,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const DarkModeSwitch(),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSearchBar(BuildContext context) {
    final bool isDark = Provider.of<DarkThemeProvider>(context).dTheme;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SliverAppBar(
      elevation: 0,
      backgroundColor: !isLandscape && _sliverScrollController.offset > kToolbarHeight + 150
          ? isDark
              ? Colors.black
              : const Color.fromARGB(255, 219, 243, 220)
          : Colors.transparent,
      pinned: true,
      titleSpacing: 0,
      toolbarHeight: 70,
      title: CustomSearchBar(
        controller: controller,
        onChanged: search,
        onSearch: () {
          search(controller.value.text.toLowerCase());
        },
      ),
    );
  }
}
