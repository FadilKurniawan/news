import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/BlocImport.dart';
import 'package:news/style/styleImport.dart';

import 'Articles_page.dart';

class ListNewsSource extends StatefulWidget {
  ListNewsSource({Key key}) : super(key: key);

  @override
  _ListNewsSourceState createState() => _ListNewsSourceState();
}

class _ListNewsSourceState extends State<ListNewsSource> {
    NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(LoadNewsSource());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top:10, bottom: 20),
        child: BlocBuilder<NewsBloc,NewsState>(
            bloc:newsBloc,
            builder: (BuildContext context, NewsState state){
              if(state is NewsLoading){
                return Center(
                  child:Center(child: CircularProgressIndicator()),
                );
              }else if(state is NewsLoaded){
                return Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: state.news.length,
                    itemBuilder: (BuildContext context,int index){
                    final newsItem = state.news[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ArticlesPage(domain: newsItem.id,title: newsItem.name,)));
                      },
                      child: Card(
                          color: Colors.white,
                          elevation: 5.0 ,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  newsItem.name ,
                                  style: styleItemCardTitle,
                                ),
                                Padding(padding: EdgeInsets.all(2.0)),
                                Text(
                                  newsItem.description ,
                                  style: styleItemCardSubTitle,
                                ),
                              ],
                            ),
                          ),
                      ),
                    );
                  },
              ),
                );
              }
            },
          ),
        ),
    );
  }
}