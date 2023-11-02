import 'package:flutter/material.dart';
import 'pic.dart';
import 'friends.dart';
import 'friendbody.dart';


class FriendDetailHeader extends StatelessWidget {
  static const BACKGROUND_IMAGE = 'images/1.jpg';

   FriendDetailHeader(
      this.friend, {
        required this.avatarTag,
      });

  final Friend friend;
  final Object avatarTag;

  Widget _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return DiagonallyCutColoredImage(
      Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB8338f4),
    );
  }

  Widget _buildAvatar() {
    return Hero(
      tag: avatarTag,
      child: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatar),
        radius: 50.0,
      ),
    );
  }

  Widget _buildFollowerInfo(TextTheme textTheme) {
    var followerStyle = const TextStyle(
      color: Color(0xBBFFFFFF),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('90 Following', style: followerStyle),
          Text(
            ' | ',
            style: followerStyle.copyWith(
                fontSize: 24.0, fontWeight: FontWeight.normal),
          ),
          Text('100 Followers', style: followerStyle),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createPillButton(
            'HIRE ME',
            backgroundColor: theme.colorScheme.secondary,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: _createPillButton(
              'FOLLOW',
              textColor: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createPillButton(
      String text, {
        Color backgroundColor = Colors.transparent,
        Color textColor = Colors.white70,
      }) {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(30.0),
      child: new MaterialButton(
        minWidth: 140.0,
        color: backgroundColor,
        textColor: textColor,
        onPressed: () {},
        child: new Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Stack(
      children: <Widget>[
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: new Column(
            children: <Widget>[
              _buildAvatar(),
              _buildFollowerInfo(textTheme),
              _buildActionButtons(theme),
            ],
          ),
        ),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.white),
        ),
      ],
    );
  }
}