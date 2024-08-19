import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widget/webtoon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Today's 툰s",
          style: TextStyle(
            fontSize: 24,
            color: Colors.green,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, sanpshot) {
          if (sanpshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Expanded(child: makeList(sanpshot)),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> sanpshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      itemBuilder: (context, index) {
        var webtoon = sanpshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: sanpshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(width: 30.0),
    );
  }
}
