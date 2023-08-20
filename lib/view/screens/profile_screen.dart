import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/heading_text.dart';
import '../components/paragraph_text.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ValueNotifier<bool> _enabled = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    late TheamColors theamController = TheamColors();

    theamController = Provider.of<TheamColors>(context, listen: false);

    return Consumer<TheamColors>(
      builder: (BuildContext context, value, Widget? child) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                height: screenwidth * 0.05,
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  // tileColor: Colors.black,
                  leading: Icon(
                    Icons.person,
                    color: TheamColors.unselectedChipColor,
                    size: 29,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(color: TheamColors.HtexrtColor1),
                  ),
                  subtitle: Text(
                    'Edit user details',
                    style: TextStyle(color: TheamColors.HtexrtColor2),
                  ),
                  style: ListTileStyle.list,
                  //  style: Colors.amberAccent,   CupertinoIcons.cube_box_fill
                ),
              ),
              ListTile(
                // tileColor: Colors.black,
                leading: Icon(
                  //  Icons. dark_mode,
        
                  _enabled.value == true ? Icons.dark_mode : Icons.light_mode,
                  color: TheamColors.unselectedChipColor,
                  size: 29,
                ),
                title: Text(
                  'Dark Mode',
                  style: TextStyle(color: TheamColors.HtexrtColor1),
                ),
                subtitle: Text(
                  'Enable disable dark mode',
                  style: TextStyle(color: TheamColors.HtexrtColor2),
                ),
                trailing: Switch(
                  activeColor: Colors.deepPurpleAccent,
                  onChanged: (bool? value) {
                    theamController.SetDarkMode(value!);
                    _enabled.value = value!;
                  },
                  value: _enabled.value,
                ),
                style: ListTileStyle.list,
                //  style: Colors.amberAccent,
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  // tileColor: Colors.black,
                  leading: Icon(
                    Icons.logout,
                    color: TheamColors.unselectedChipColor,
                    size: 29,
                  ),
                  title: Text(
                    'Signe Out',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  subtitle: Text(
                    'Signe out user from user acount',
                    style: TextStyle(color: TheamColors.HtexrtColor2),
                  ),
                  style: ListTileStyle.list,
                  //  style: Colors.amberAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



