import 'package:flutter/material.dart';
 
const image1 =
    'https://zerocarbon-analytics.org/wp-content/uploads/2022/11/boat-gbed9714c1_1920-800x400.jpg';
const image2 = 'https://imgs.mongabay.com/wp-content/uploads/sites/30/2020/05/28115637/sundarbans-mangroves.jpg';
const image3 = 'https://cdn.kimkim.com/files/a/images/201f9cc3872dd27d5e2807b62d80202f0aaa4954/original-6a3afb055fd9c379127eaf76b8de2336.jpg';
const image4 = 'https://static.toiimg.com/photo/104496916.cms';
 
const sundarban =
'''The Sundarbans mangrove forest, one of the largest such forests in the world (140,000 ha), lies on the delta of the Ganges, Brahmaputra and Meghna rivers on the Bay of Bengal. It is adjacent to the border of India’s Sundarbans World Heritage site inscribed in 1987. The site is intersected by a complex network of tidal waterways, mudflats and small islands of salt-tolerant mangrove forests, and presents an excellent example of ongoing ecological processes. The area is known for its wide range of fauna, including 260 bird species, the Bengal tiger and other threatened species such as the estuarine crocodile and the Indian python.''';
 
 
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
 
  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  final imageList = [image1, image2, image3, image4,];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(),
            _headerSection(),
            _navigationSection(),
            _bodySection(),
          ],
        ),
      ),
    );
  }
 
  Widget _bodySection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(sundarban),
    );
  }
 
  Widget _navigationSection() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call, color: Colors.blue),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'CALL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.near_me, color: Colors.blue),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'ROUTE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share, color: Colors.blue),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
 
  Widget _headerSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Sundarbans',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Khulna Division, Bangladesh',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '9.5',
          )
        ],
      ),
    );
  }
 
  Widget _imageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          imageList[index],
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        const Positioned.fill(
          child: Center(
            child: Text(
              'Sundarbans',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: -20,
          left: 10,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 50,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
        Positioned(
          right: 4,
          bottom: 4,
          child: ElevatedButton(
            onPressed: index == imageList.length - 1 ? null : () {
              setState(() {
                index++;
              });
            },
            child: const Text('>>'),
          ),
        ),
        Positioned(
          left: 4,
          bottom: 4,
          child: ElevatedButton(
            onPressed: index == 0 ? null : () {
              setState(() {
                index--;
              });
            },
            child: const Text('<<'),
          ),
        ),
      ],
    );
  }
}