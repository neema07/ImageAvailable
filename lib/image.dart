import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:imageviewer/login.dart';


class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  List<dynamic> _imageList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

    if (response.statusCode == 200) {
      setState(() {
        _imageList = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMAGE VIEW '),
        actions: [IconButton(onPressed: (){ Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login(),));}, icon: Icon(Icons.logout))],
      ),
      body: _imageList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
             child: Column(
                children: [
                  for (var image in _imageList)Padding(
                      padding: const EdgeInsets.all(8.0),child: Column(
                        children: [
                          Image.network(image['download_url']),
                          SizedBox(height: 8),
                          Text(
                            image['author'],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                ])
            ),
    );
  }
}
