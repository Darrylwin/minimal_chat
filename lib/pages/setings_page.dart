import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: [],
        ),
        body:
            // Container(
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).colorScheme.secondary,
            //     borderRadius: BorderRadius.circular(
            //       30,
            //     ),
            //   ),
            //   margin: const EdgeInsets.all(25),
            //   padding: const EdgeInsets.all(16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // dark mode
            //       Text(
            //         '  Dark Mode',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Theme.of(context).colorScheme.inversePrimary),
            //       ),

            //       // switch toggle
            //       CupertinoSwitch(
            //         value:
            //             Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            //         onChanged: (value) =>
            //             Provider.of<ThemeProvider>(context, listen: false)
            //               ..toggleTheme(),
            //       ),
            //     ],
            //   ),
            // ),

            Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                // dark mode
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // dark mode
                      Text(
                        '  Dark Mode',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      // switch toggle
                      CupertinoSwitch(
                        value:
                            Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode,
                        onChanged: (value) =>
                            Provider.of<ThemeProvider>(context, listen: false)
                              ..toggleTheme(),
                      ),
                    ],
                  ),
                ),

                //blocked users
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // title
                      Text(
                        '  Blocked Users',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      // button to go to blocked users page
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlockedUsersPage(),
                          ),
                        ),
                        icon: Icon(Icons.arrow_forward_rounded),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
