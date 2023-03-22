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
    body: Container(
        child: Center(child: Text("Chat")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
      
      
      //  Column(children: <Widget>[
      //   const Text('Align Button to the Bottom in Flutter'),
      //   Expanded(
      //       child: Align(
      //           alignment: Alignment.bottomCenter,
      //           child: ElevatedButton(
      //               onPressed: () {}, child: const Text('Bottom Button!'))))
      // ])

    );
  }
}

