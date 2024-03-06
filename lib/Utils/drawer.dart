import 'package:flutter/material.dart';
import 'package:lcms_app/Utils/routeNames.dart';
import 'package:lcms_app/res/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../View/Profile_View.dart';
import '../view_model/UserProfile_VM.dart';
import '../view_model/logout_vm.dart';
import '../view_model/user_viewmodel.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final logoutProvider = Provider.of<LogoutVM>(context);
    final double avatarRadius = 25;
    final double avatarDiameter = avatarRadius * 5;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.drawerheadColor,
            ),
            child: Center(
              child: Container(
                width: avatarDiameter,
                height: avatarDiameter,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/cli.png'),
                  backgroundColor: AppColors.avatarColor,
                ),
              ),
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
              });
            },
            child: ListTile(
              title: const Text(
                'Dashboard',
                 style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16)
              ),
              leading: const Icon(Icons.dashboard_outlined),
              tileColor: _isHovered ? Colors.blue : null,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.dashboard);
              },
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
              });
            },
            child: ListTile(
              title: const Text(
                'Cases',
                  style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16)
              ),
              leading: Icon(Icons.cases_outlined),
              tileColor: _isHovered ? Colors.blue : null,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.cases);
              },
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
              });
            },
            child: ListTile(
              title: const Text(
                'Hearings',
                  style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16)
              ),
              leading: Icon(Icons.gavel_outlined),
              tileColor: _isHovered ? Colors.blue : null,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.hearings);
              },
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
              });
            },
            child: ListTile(
              title: const Text(
                'Upload Documents',
                  style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16)
              ),
              leading: Icon(Icons.document_scanner_outlined),
              tileColor: _isHovered ? Colors.blue : null,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.documentScreen);
              },
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
              });
            },
            child: ListTile(
              title: const Text(
                'Profile',
                  style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16)
              ),
              leading: Icon(Icons.person_2_rounded),
              tileColor: _isHovered ? Colors.blue : null,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.profile);
              },
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
              });
            },
            child: ListTile(
              title: const Text(
                'Logout',
                  style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16)
              ),
              leading: const Icon(Icons.logout_outlined,),
              tileColor: _isHovered ? Colors.blue : null,
              onTap: () {
                logoutProvider.logoutApi(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
