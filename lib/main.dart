import 'package:flutter/material.dart';
import 'package:no_wander/City.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Wander',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _cities = [
    City('Cape Town', '40 places to visit',
        'https://media.timeout.com/images/105237728/image.jpg'),
    City('New York', '40 places to visit',
        'https://media.timeout.com/images/105237728/image.jpg'),
    City('Paris', '40 places to visit',
        'https://media.timeout.com/images/105237728/image.jpg'),
    City('Rome', '40 places to visit',
        'https://media.timeout.com/images/105237728/image.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Header(),
          Search(),
          Expanded(
            child: Cities(cities: this._cities),
          )
        ],
      ),
    );
  }
}

class Cities extends StatelessWidget {
  final List<City> cities;

  const Cities({Key key, this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        var city = cities[index];
        return SizedBox(
          height: 200.0,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    image: DecorationImage(
                      image: NetworkImage(city.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0x00000000),
                        const Color(0xCC000000),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        city.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 24.0),
                      ),
                      Text(
                        city.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.grey[300],
            size: 24.0,
          ),
          Container(
            child: Text(
              'Find destination',
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w200,
                  fontSize: 16.0),
            ),
            margin: const EdgeInsets.only(left: 8.0),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello, Gustavo!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xFF383838),
                      fontWeight: FontWeight.w900,
                      fontSize: 24.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Where to next?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF383838),
                        fontWeight: FontWeight.w200,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI"),
            ),
          ),
        ],
      ),
    );
  }
}
