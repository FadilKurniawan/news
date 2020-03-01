import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/BlocImport.dart';
import 'package:news/pages/List_Articles_page.dart';
import 'package:news/style/styleImport.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key key, this.domain, this.title}) : super(key: key);
  final String domain;
  final String title;

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  bool _searched = false;


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
            centerTitle: true,
            leading: _isSearching ? const BackButton() :  BackButton(),
            title: _isSearching ? _buildSearchField() : Text(widget.title),
            actions: _buildActions(),
         ),
         body: ArticlesList(domain: widget.domain,),
       ),
    );
  }
Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: colorHintDarken,
        borderRadius: BorderRadius.circular(5)
      ),
      padding: EdgeInsets.only(left: 10,right:10),
      child: TextField(
        controller: _searchQueryController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search Article...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.black54, fontSize: 16.0),
        ),
        textInputAction: TextInputAction.search,
        style: styleInputField,
        onSubmitted: (value){
          BlocProvider.of<NewsBloc>(context).add(LoadNewsArticles(domain: widget.domain,title: value));
          setState(() {
            _searched =true;
          });
        },
      ),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
                  if(_searched){
                    BlocProvider.of<NewsBloc>(context).add(LoadNewsArticles(domain: widget.domain));
                    setState(() {
                      _searched =false;
                    });
                  }
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }


  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
    });
  }
  @override
  void dispose() {
    _searchQueryController.dispose();     
    super.dispose();
  }
}