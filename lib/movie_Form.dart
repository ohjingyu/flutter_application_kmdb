import 'package:flutter/material.dart';

class MovieForm extends StatelessWidget {
  Map<String, dynamic> movie; // movie['nation']

  MovieForm({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var directorNm = movie['directors']['director'][0]['directorNm'];
    var actorNm = movie['actors']['actor'][0]['actorNm'];
    var posters = movie['posters'].split('|')[0];

    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      child: Row(children: [
        SizedBox(
          child: Image.network(posters),
          width: 80,
          height: 100,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${movie['title']}(${movie['prodYear']})',
              style: TextStyle(fontSize: 20),
            ),
            Text('$directorNm/$actorNm'),
            Text('${movie['repRlsDate']}'),
            Text('${movie['audiAcc']}'),
            Text('${movie['rating']}'),
          ],
        ))
      ]),
    );
  }
}
