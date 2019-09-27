import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Grid Hero",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarpahlawan = new List();

  var karakter = [
    {
      "nama": "Ahmad Dahlan",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/8/87/Ahmad_Dahlan.jpg",
      "tanggal": "1 Agustus 1868",
      "asal" : "Yogyakarta",
      "deskripsi" : "Salah seorang ulama dan khatib terkemuka di Masjid Besar Kasultanan Yogyakarta pada masa itu, dan ibu dari K.H. Ahmad Dahlan adalah puteri dari H. Ibrahim yang juga menjabat penghulu Kesultanan Ngayogyakarta Hadiningrat pada masa itu. KH. Ahmad Dahlan telah mempelopori kebangkitan ummat Islam untuk menyadari nasibnya sebagai bangsa terjajah yang masih harus belajar dan berbuat."
    },
    {
      "nama": "Ahmad Yani",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/3/3f/Ahmad_Yani.jpg",
      "tanggal": "19 June 1922",
      "asal" : "Purworejo",
      "deskripsi" : "Jenderal TNI Anumerta Ahmad Yani (juga dieja Achmad Yani; lahir di Purworejo, Jawa Tengah, 19 Juni 1922 – meninggal di Lubang Buaya, Jakarta, 1 Oktober 1965 pada umur 43 tahun) adalah komandan Tentara Nasional Indonesia Angkatan Darat, dan dibunuh oleh anggota Gerakan 30 September saat mencoba untuk menculik dia dari rumahnya.",
    },
    {
      "nama": "Sutomo",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/e/ed/Bung_Tomo.jpg",
      "tanggal": "3 October 1920",
      "asal": "Surabaya",
      "deskripsi" : "",
    },
    {
      "nama": "Gatot Soebroto",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/b/be/Col_Gatot_Subroto%2C_Kenang-Kenangan_Pada_Panglima_Besar_Letnan_Djenderal_Soedirman%2C_p27.jpg",
      "tanggal": "10 October 1907",
      "asal": "Sumpiuh",
      "deskripsi" : "",
    },
    {
      "nama": "Ki Hadjar Dewantarai",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/3/3a/Ki_Hadjar_Dewantara_Mimbar_Umum_18_October_1949_p2.jpg",
      "tanggal": "2 Mei 1889",
      "asal": "Yogyakarta",
      "deskripsi" : "",
    },
    {
      "nama": "Mohammad Hatta",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/VP_Hatta.jpg/330px-VP_Hatta.jpg",
      "tanggal": "12 Agustus 1902",
      "asal": "Bukittinggi",
      "deskripsi" : "",
    },
    {
      "nama": "Soedirman",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/b/be/Col_Gatot_Subroto%2C_Kenang-Kenangan_Pada_Panglima_Besar_Letnan_Djenderal_Soedirman%2C_p27.jpg",
      "tanggal": "24 January 1916",
      "asal": "Bodas Karangjati",
      "deskripsi" : "",
    },
    {
      "nama": "Soekarno",
      "gambar":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Presiden_Sukarno.jpg/330px-Presiden_Sukarno.jpg",
      "tanggal": "11 Maret 1966",
      "asal": "Surabaya",
      "deskripsi" : "",
    }
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarpahlawan.add(new Container(
          padding: new EdgeInsets.all(5),
          child: new Card(
              child: new Column(
            children: <Widget>[
              Expanded(
                child: new Hero(
                  tag: karakternya['nama'],
                  child: new Material(
                    child: new InkWell(
                      child: Image.network(
                        gambar,
                        fit: BoxFit.fill,
                        width: 200,
                      ),
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Detail(
                            nama: karakternya['nama'], gambar: gambar, tanggal: karakternya['tanggal'], asal: karakternya['asal'], deskripsi: karakternya['deskripsi'],),
                      )),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  karakternya['nama'],
                  style: new TextStyle(fontSize: 18),
                ),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text(
          "Pahlawan",
          style: new TextStyle(color: Colors.white),
        )),
        body: new GridView.count(
          crossAxisCount: 2, //jumlah kotak mendatar
          children: daftarpahlawan,
        ));
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar, this.tanggal, this.asal, this.deskripsi });
  final String nama;
  final String gambar;
  final String tanggal;
  final String asal;
  final String deskripsi;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail $nama"),
        backgroundColor: Colors.blue,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                    child: new Image.network(
                  gambar,
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
          new Bagiannama(
            nama: nama,
          ),
          new BagianIcon(
            tanggal: tanggal,
            asal: asal,
          ),
          new Keterangan(
            deskripsi:deskripsi,
          ),
        ],
      ),
    );
  }
}

class Bagiannama extends StatelessWidget {
  Bagiannama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Expanded(
            //memenuhi area sampai mentok
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17, color: Colors.black),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 50,
                color: Colors.red,
              ),
              new Text(
                '12',
                style: new TextStyle(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  BagianIcon ({this.tanggal, this.asal});
  final String tanggal;
  final String asal;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.home,
            teks: asal,
          ),
          new Iconteks(
            icon: Icons.date_range,
            teks: tanggal,
          ),
          new Iconteks(
            icon: Icons.info,
            teks: "Info",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  Keterangan({this.deskripsi});
  final String deskripsi;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Card(
        child: new Text(deskripsi,style: new TextStyle(fontSize: 18, color: Colors.black,),textAlign: TextAlign.justify,),
      ),
    );
  }
}