import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'description.dart';
import 'friends.dart';
import 'friendbody.dart';

class FriendsListPage extends StatefulWidget {
  @override
  _FriendsListPageState createState() => new _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    Uri url = Uri.parse('https://randomuser.me/api/?results=25');
    http.Response response = await http.get(url);

    setState(() {
      _friends = Friend.allFromResponse(response.body);
    });
  }

  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _friends[index];

    return ListTile(
      onTap: () => _navigateToFriendDetails(friend, index),
      leading: Hero(
        tag: index,
        child: CircleAvatar(
          backgroundImage: NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

  void _navigateToFriendDetails(Friend friend, Object avatarTag) {
    Navigator.of(context).push(
       MaterialPageRoute(
        builder: (c) => Scaffold(
              body: FriendDetailHeader(friend, avatarTag: avatarTag),
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_friends.isEmpty) {
      content =  const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      content =  ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _buildFriendListTile,
      );
    }

    return Scaffold(
      appBar: AppBar(title: new Text('My Friends')),
      body: content,
    );
  }
}