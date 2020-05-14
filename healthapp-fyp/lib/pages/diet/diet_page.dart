import 'package:TMW/pages/diet/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;

import 'food_info.dart';

class DietPage extends StatefulWidget {
  DietPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final List<String> kWords;
  _SearchAppBarDelegate _searchDelegate;

  //Initializing with sorted list of english words
  _DietPageState()
      : kWords = List.from(Set.from(words.all))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  @override
  void initState() {
    super.initState();
    //Initializing search delegate with sorted list of English words
    _searchDelegate = _SearchAppBarDelegate(kWords);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Search for Food Calories",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                showSearchPage(context, _searchDelegate);
              })
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.transparent),
          Container(
            height: screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/diet/greenapple.jpg'),
                    fit: BoxFit.cover)),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.95,
            initialChildSize: 0.85,
            minChildSize: 0.75,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: ListView(
                      controller: scrolController,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30.0, left: 15.0, bottom: 10.0),
                          child: Text(
                            'Dietary Advice',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, bottom: 10.0, right: 25.0),
                          child: Text(
                            'Enjoy one of our heahty food recipes',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9E9E9E)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Container(
                              height: 275.0,
                              width: 310.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  _buildFoodCard('Fruit Salad', '248kcal',
                                      'assets/images/diet/salad.png'),
                                  _buildFoodCard('Green Salad', '241kcal',
                                      'assets/images/diet/greensalad.png'),
                                  _buildFoodCard('Apple Pie', '124kcal',
                                      'assets/images/diet/applepie.png'),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, bottom: 10.0, right: 25.0),
                          child: Text(
                            'Your Favourite',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9E9E9E)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Container(
                              height: 275.0,
                              width: 310.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  _buildFoodCard('Green Salad', '241kcal',
                                      'assets/images/diet/strawberries.png'),
                                  _buildFoodCard('Green Salad', '241kcal',
                                      'assets/images/diet/kiwi.png'),
                                  _buildFoodCard('Green Salad', '241kcal',
                                      'assets/images/diet/blueberries.png'),
                                  _buildFoodCard('Apple Pie', '124kcal',
                                      'assets/images/diet/mango.png'),
                                ],
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildFoodCard(String title, String calCount, String imgPath) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecipeDetails(
                  heroTag: imgPath, calCount: calCount, dishName: title)));
        },
        child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Stack(children: [
              Container(
                height: 275.0,
                width: 200.0,
              ),
              Positioned(
                  top: 7.0,
                  child: Container(
                    height: 250.0,
                    width: 175.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFF20D3D2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(title,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 7.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                              'A refreshing and incredible testing fruit salad',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(height: 25.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(calCount,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 25.0),
                      ],
                    ),
                  )),
              Positioned(
                  left: 90.0,
                  child: Hero(
                      tag: imgPath,
                      child: Container(
                        height: 110.0,
                        width: 110.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath), fit: BoxFit.cover)),
                      )))
            ])));
  }

  //Shows Search result
  void showSearchPage(
      BuildContext context, _SearchAppBarDelegate searchDelegate) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }
}

//Search delegate
class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _SearchAppBarDelegate(List<String> words)
      : _words = words,
        //pre-populated history of words
        _history = <String>['apple', 'orange', 'banana'],
        super();

  // Setting leading icon for the search bar.
  //Clicking on back arrow will take control to main page
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  // Builds page to populate search results.
  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/diet/greenapple.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListView(
            children: <Widget>[       
              Card(
                color: Colors.white,
                elevation: 10.0,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        this.query,
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Generic Cal: 94',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              // Card(color: Colors.indigoAccent, elevation: 10.0, child: FoodInfo()),
              FoodInfo(),
              
            ],
          ),
        ],
      ),
    );
  }

  // Suggestions list while typing search query - this.query.
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _WordSuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }
}

// Suggestions list widget displayed in the search page.
class _WordSuggestionList extends StatelessWidget {
  const _WordSuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
