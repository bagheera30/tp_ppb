import 'package:flutter/material.dart';

class Tp5 extends StatefulWidget {
  const Tp5({super.key});

  @override
  State<Tp5> createState() => _Tp5State();
}

class _Tp5State extends State<Tp5> {
  int _current = 0;
  final _pgc = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pgc,
          onPageChanged: (i) {
            setState(() {
              _current = i;
            });
          },
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Home page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
                child: Text(
              'Email page',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            const Center(
                child: Text('Profle page',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        onTap: (index) {
          _pgc.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
/*body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.home,
                color: Colors.red,
              ),
              icon: new Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: new Text('Beranda',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.red
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.assignment,
                color: Colors.red,
              ),
              icon: new Icon(
                Icons.assignment,
                color: Colors.grey,
              ),
              title: new Text('Produk',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 1
                          ? Colors.red
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.people,
                color: Colors.red,
              ),
              icon: new Icon(
                Icons.people,
                color: Colors.grey,
              ),
              title: new Text('Akun',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 2
                          ? Colors.red
                          : Colors.grey)),
            ),
          ],
        ));*/