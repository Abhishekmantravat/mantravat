import 'package:flutter/material.dart';
import 'package:mintravat_project/main.dart';

void main() => runApp(const Home_view());

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mantravat"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.account_circle,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 1, 117, 211),


                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "edit_profile");
                      },
                      child: const Text(
                        "A",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    )

    
                    ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader

            ListTile(
              leading: const Icon(Icons.manage_accounts),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pushNamed(context, 'edit_profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_people),
              title: const Text(' All Employee '),
              onTap: () {
                Navigator.pushNamed(context, 'all_employee');
              },
            ),
            ListTile(
              leading: const Icon(Icons.task_alt),
              title: const Text(' Task '),
              onTap: () {
                Navigator.pushNamed(context, 'task');
              },
            ),
            ListTile(
              leading: const Icon(Icons.more_time_sharp),
              title: const Text(' Time sheet '),
              onTap: () {
                Navigator.pushNamed(context, 'time_sheet');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pushNamed(context, 'logout');
              },
            ),
          ],
        ),
      ),
    body: BasicBottomNavBar()
    );
  }
}
class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
   Text("Home Screen"),
       Text("Task screen"),
   Text("Chat screen"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.grab,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}