import 'package:flutter/material.dart';
import 'package:flutter_application_kmdb/movie_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late var controller = TextEditingController();

  void searchMovie(String keyword) {
    MovieApi movieApi = MovieApi();
    movieApi.search(keyword);
  }

  void showSearchPage() async {
    var result = showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 200,
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                label: Text('닫기')),
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  searchMovie(controller.text);
                  Navigator.pop(context);
                },
                child: Text('검색하기'))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
      floatingActionButton: FloatingActionButton(
        onPressed: showSearchPage,
        child: Icon(Icons.search),
      ),
    );
  }
}
