import 'package:flutter/material.dart';

class SideBarItem {
  String? title;
  IconData? iconData;
  String? route;

  SideBarItem({this.iconData, this.route, this.title});
}

List<SideBarItem> sideBarItems = [
  SideBarItem(iconData: Icons.home, title: 'Home', route: '/home'),
  SideBarItem(iconData: Icons.wallet_giftcard, title: 'Wallet', route: '/wallet'),
  SideBarItem(iconData: Icons.person, title: 'Profile', route: '/user'),
];

class SideBarWidget extends StatelessWidget {
  SideBarWidget({Key? key, required this.selected}) : super(key: key);

  String selected = 'home';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Text(" Is Me o"),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: ListView.builder(
                itemCount: sideBarItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(sideBarItems[index].iconData),
                    title: Text('${sideBarItems[index].title}'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, sideBarItems[index].route!);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
