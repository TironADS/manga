import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga/BloC/manga_bloc.dart';
import 'package:manga/Repository/Model/MangaModel.dart';
import 'package:manga/UI/More.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late MangaModel data;

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<MangaBloc>(context).add(FetchManga());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('manga'), Icon(Icons.notifications_active)],
          ),
        ),
      ),
      body: BlocBuilder<MangaBloc, MangaState>(builder: (context, state) {
        if (state is MangaBlocLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MangaBlocError) {
          return Center(
            child: Text('something else !!'),
          );
        }
        if (state is MangaBlocLoaded) {
          data = BlocProvider.of<MangaBloc>(context).mangaModel;

          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => More(
                            title: data.data![index].title.toString(),
                              discn : data.data![index].summary.toString(),
                              contry : data.data![index].type.toString(),
                            sub : data.data![index].subTitle.toString(),
                              )));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 70,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 250,
                                child: Text(
                                  data.data![index].title.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Row(
                              children: [
                                Text(
                                  'Status :  ',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  data.data![index].status.toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 20,
                  ),
              itemCount: data.data!.length);
        } else {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          );
        }
      }),
    );
  }
}
