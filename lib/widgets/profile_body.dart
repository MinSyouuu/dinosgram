import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinosgram/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:dinosgram/constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedLeft = SelectedTab.left;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size.width;

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
              _tabButtons(),
              _selectedIndicator(),
            ]),
          ),
          _imagesPager(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
        child: Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
          curve: Curves.fastOutSlowIn,
          child: _images(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
          curve: Curves.fastOutSlowIn,
          child: _images(),
        ),
      ],
    ));
  }

  GridView _images() {
    return GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
            30,
            (index) => CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: 'https://picsum.photos/id/$index/100/100'),
          ),
        );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: _selectedLeft == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      curve: Curves.fastOutSlowIn,
      child: Container(
        height: 3,
        width: size.width / 2,
        color: Colors.black87,
      ),
    );
  }

  Row _tabButtons() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedLeft = SelectedTab.left;
                _leftImagesPageMargin = 0;
                _rightImagesPageMargin = size.width;
              });
            },
            icon: ImageIcon(
              AssetImage('assets/images/grid.png'),
              color: _selectedLeft == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedLeft = SelectedTab.right;
                _leftImagesPageMargin = -size.width;
                _rightImagesPageMargin = 0;
              });
            },
            icon: ImageIcon(
              AssetImage('assets/images/saved.png'),
              color: _selectedLeft == SelectedTab.left
                  ? Colors.black26
                  : Colors.black,
            ),
          ),
        ),
      ],
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

enum SelectedTab { left, right }
