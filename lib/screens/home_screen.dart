import 'package:coffe_maker/main.dart';
import 'package:coffe_maker/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/items_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
                  color: Color(0xffe57534).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
                ],
              ),
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
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
