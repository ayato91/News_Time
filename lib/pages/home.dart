import 'package:flutter/material.dart';
import 'package:news_app_with_api/components/article_viewer_widget.dart';
import 'package:news_app_with_api/model/article_model.dart';
import 'package:news_app_with_api/services/all_service_api.dart';
import 'package:news_app_with_api/services/trending_service_api.dart';
import 'package:news_app_with_api/services/mobile_service_api.dart';
import 'package:news_app_with_api/services/home_service_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeServiceApi clientHome = HomeServiceApi();
  TrendingServiceApi clientTrending = TrendingServiceApi();
  MobileServiceApi clientMobile = MobileServiceApi();
  AllServiceApi clientAll = AllServiceApi();
  int pageValue = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('News Time',
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),

        //!ButtomNavigationBar for different type of news

        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) => setState(() {
            pageValue = value;
          }),
          selectedIndex: pageValue,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.trending_up), label: 'Trending'),
            NavigationDestination(
                icon: Icon(Icons.phone_iphone_sharp), label: 'Mobile'),
            NavigationDestination(icon: Icon(Icons.star), label: 'All'),
          ],
        ),
        body: <Widget>[
          //! For Home Section
          Scrollbar(
            interactive: true,
            thickness: 9,
            trackVisibility: true,
            child: FutureBuilder(
              future: clientHome.getArticles(),
              builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (context, index) {
                      return articleViewer(articles![index], context);
                    },
                  );
                } else if (snapshot.hasError) {
                  //! Exception Handling

                  return const Center(
                      child: Text(
                    " Something Went Wrong :(",
                    style: TextStyle(fontSize: 30),
                  ));
                }
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Center(
                      child: Text(
                        '\nNews Time is Getting Ready :)',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          //! For Trending section

          Scrollbar(
            interactive: true,
            thickness: 9,
            trackVisibility: true,
            child: FutureBuilder(
              future: clientTrending.getArticles(),
              builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (context, index) {
                      return articleViewer(articles![index], context);
                    },
                  );
                } else if (snapshot.hasError) {
                  //! Exception Handling

                  return const Center(
                      child: Text(
                    " Something Went Wrong :(",
                    style: TextStyle(fontSize: 30),
                  ));
                }
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Center(
                      child: Text(
                        '\nGetting Ready :)',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          //! For Mobile Section

          Scrollbar(
            interactive: true,
            thickness: 9,
            trackVisibility: true,
            child: FutureBuilder(
              future: clientMobile.getArticles(),
              builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (context, index) {
                      return articleViewer(articles![index], context);
                    },
                  );
                } else if (snapshot.hasError) {
                  //! Exception Handling

                  return const Center(
                      child: Text(
                    " Something Went Wrong :(",
                    style: TextStyle(fontSize: 30),
                  ));
                }
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Center(
                      child: Text(
                        '\nGetting Ready :)',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          //! For ALl Section

          Scrollbar(
            interactive: true,
            thickness: 9,
            trackVisibility: true,
            child: FutureBuilder(
              future: clientAll.getArticles(),
              builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (context, index) {
                      return articleViewer(articles![index], context);
                    },
                  );
                } else if (snapshot.hasError) {
                  //! Exception Handling

                  return const Center(
                      child: Text(
                    " Something Went Wrong :(",
                    style: TextStyle(fontSize: 30),
                  ));
                }
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Center(
                      child: Text(
                        '\nGetting Ready :)',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ][pageValue],
      ),
    );
  }
}
