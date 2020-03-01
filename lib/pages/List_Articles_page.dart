import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/BlocImport.dart';
import 'package:news/pages/Webview_page.dart';
import 'package:news/style/styleImport.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticlesList extends StatefulWidget {
  ArticlesList({Key key, this.domain}) : super(key: key);
  final String domain;
  @override
  _ArticlesListState createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {

    NewsBloc newsBloc;
    @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(LoadNewsArticles(domain: widget.domain));
  }
@override
void dispose() {  
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
           child: Padding(
             padding: const EdgeInsets.all(2.0),
             child: Column(
               children: <Widget>[
                 Expanded(
                   child: BlocBuilder<NewsBloc,NewsState>(
                     builder: (BuildContext context, NewsState state) {
                       if(state is ArticlesLoading){
                         return Center(child: CircularProgressIndicator());
                       }else if(state is ArticlesLoaded){
                         if(state.articles.length>0){
                            return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: state.articles.length,
                            itemBuilder: (BuildContext context, int index){
                            final articles = state.articles[index];
                            return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewPage(title: articles.title, url: articles.url,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  color: Colors.white,
                                  elevation:5.0 ,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0,bottom: 12,left: 0,right: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft:Radius.circular(8.0), 
                                            topRight:Radius.circular(8.0)),
                                          child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            image:articles.urlToImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            articles.title ,
                                            style: styleItemCardTitle,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                          child: Text(
                                            articles.description ,
                                            style: styleItemCardSubTitle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                            ),
                          );
                            }
                          );
                         }else{
                           return Center(child: Text(Constant.textNoArticle,style: styleNoData,));
                         }
                       } 
                     },
                   )
                )
               ],
             ),
           ),
         ),
    );
  }
}