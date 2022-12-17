import 'package:flutter/material.dart';

import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';

import 'items_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  final List<Widget> _pages = [
    Home(),
    History(),
    Search(),
    Alarm(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }

    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: currentPage,
        barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
        arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
        itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
        itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
        circleOutline: 15.0,
        shadowAllowance: 0.0,
        circleSize: 50.0,
        blurShadowRadius: 50.0,
        circleColor: Color(0xffe57534).withOpacity(0.6),
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.black.withOpacity(0.8),
        tabs: getTabsData(),
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}

List<TabData> getTabsData() {
  return [
    TabData(
      icon: Icons.home,
      iconSize: 25.0,
      title: 'Home',
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.favorite_outline,
      iconSize: 25,
      title: 'Favorite',
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.notifications,
      iconSize: 25,
      title: 'Notifications',
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.person,
      iconSize: 25,
      title: 'Person',
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
  ];
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.sort_rounded,
                        color: Color(0xffe57534).withOpacity(0.6),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications,
                        color: Color(0xffe57534).withOpacity(0.6),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It's a Great Day for Coffe",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffe57534).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Find your coffe",
                    hintStyle: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black54,
                        ),
                      ],
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xffd0bb99),
                    ),
                  ),
                ),
              ),
              TabBar(
                  controller: _tabController,
                  labelColor: Color(0xffe57534),
                  unselectedLabelColor: Colors.black.withOpacity(0.7),
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xffe57534),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  tabs: [
                    Tab(text: "Hot Coffe"),
                    Tab(text: "Cold Coffe"),
                    Tab(text: "Cappuiccino"),
                    Tab(text: "Americano"),
                  ]),
              SizedBox(height: 10),
              Center(
                child: [
                  ItemsWidget(),
                  ItemsWidget(),
                  ItemsWidget(),
                  ItemsWidget(),
                ][_tabController.index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(),
      ),
    );
  }
}

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(),
      ),
    );
  }
}
