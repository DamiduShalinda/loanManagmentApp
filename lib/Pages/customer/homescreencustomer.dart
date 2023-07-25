import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Apis/getcustomerloancontroller.dart';
import '../../Widgets/viewaloan.dart';
import '../staff/login.dart';

class HomescreenCustomer extends StatefulWidget {
  final int id;
  const HomescreenCustomer({Key? key, required this.id}) : super(key: key);

  @override
  State<HomescreenCustomer> createState() => _HomescreenCustomerState();
}

class _HomescreenCustomerState extends State<HomescreenCustomer>
    with TickerProviderStateMixin {
      
  late int id;
   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  // Animation variables
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    _tabController.addListener(_handleTabChange);

    // Initialize the animation controller and set up the animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});

    // Trigger the animation when the tab is changed
    if (_tabController.index == 1) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: _tabController.index == 1 ? 400 : 150,
              floating: true, // Add animation when scrolling up
              snap: true, // Snap the app bar when scrolled down
              flexibleSpace: FlexibleSpaceBar(
                background: _buildBackgroundImage(),
                title: Text(
                  'Hasaru Enterprices',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              actions: [
                IconButton(
                 onPressed: () async {
                    final SharedPreferences prefs = await _prefs;
                    prefs.clear();
                    Get.offAll(() => const Login());
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            SliverAppBar(
              pinned: true,
              primary: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Align(
                alignment: AlignmentDirectional.center,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.redAccent,
                  tabs: const [
                    Tab(
                      child: Text('Loan Details'),
                    ),
                    Tab(
                      child: Text('Customer Details'),
                    ),
                  ],
                ),
              ),
            ),
            
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children:  [
            Expanded(child: _buildcustomerprofile()),
            const Center(
              child: Text('Customer Details'),
            ),
          ],
        ),
      ),
    );
  }

  FadeTransition? _buildBackgroundImage() {
    // Use the opacity animation to fade-in the image when the second tab is selected
    return _tabController.index == 1
        ? FadeTransition(
            opacity: _animation,
            child: Image.network(
              'https://cdn.pixabay.com/photo/2023/06/01/13/12/background-8033597_1280.png',
              fit: BoxFit.cover,
            ),
          )
        : null;
  }


  Widget _buildcustomerprofile() {
    return FutureBuilder(
          future: fetchCustomerLoanData(id),
          builder: (context , snapshot){
            if (snapshot.hasData){
              final loanData = snapshot.data!;
              return ViewaLoan(loanData: loanData);
            }else if (snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            }else{
              return const CircularProgressIndicator();
            }
          }
          );
  }
}
