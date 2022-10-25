import 'package:flutter/material.dart';
import 'package:dinosgram/constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  // const ProfileBody({Key? key}) : super(key: key);
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              _username(),
              _userBio(),
              _editProfileBtn(),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedLeft = true;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/grid.png'),
                        color: selectedLeft ? Colors.black : Colors.black26,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedLeft = false;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/saved.png'),
                        color: selectedLeft ? Colors.black26 : Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            foregroundColor: Colors.black,
          ),
          onPressed: () {},
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'this is what I believe!!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
