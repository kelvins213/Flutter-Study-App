import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled4/data/database_contents.dart';

class DBHelper {

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "subjects9.db");
    print(path);

    Database database = await openDatabase(
        path,
        version: 1,
        onCreate: onCreate,
    );
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async{
    String sql;

    sql = "create table Subject(subjectAssunt INTERGER PRIMARY KEY, title varchar(40), iconName varchar(40), titleappbar varchar(40), imageLink(300), concept varchar(500));";
    await db.execute(sql);

    await insertIntoDatabase(db: db);
  }

  Future<FutureOr<void>> insertIntoDatabase({
    required Database db,
  }) async{
    String sql;

    sql = "insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ('SUBSTANTIVOS', 'Icons.book', 'PORTUGUÊS', 'https://static3.depositphotos.com/1006126/210/i/950/depositphotos_2102902-stock-photo-alphabet-letters-made-with-diamonds.jpg', 'Qualquer classe gramatical antecedida por artigo, pronome demonstrativo, pronome indefinido ou pronome possessivo vira substantivo: o amar, um amanhã, nosso sentir, um não sei quê, o sim, o não, algum talvez, este falar, um abrir-se, o querer, aquele claro-escuro....');";
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("ADJETIVOS", "Icons.read_more", "PORTUGUÊS","https://i.pinimg.com/736x/22/20/e0/2220e036644ab7c29963fe63bb2e20af.jpg", "Mas, afinal, o que é um adjetivo? O adjetivo é uma classe de palavras variável, que é usada para colocar uma qualidade ao substantivo. Quando falamos em variável, quer dizer que pode mudar de acordo com gênero e número, seguindo os termos que qualificam. Os adjetivos também podem alterar o grau para passar maior ou menor veemência de determinada característica.");';
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("ADVÉRBIOS", "Icons.chrome_reader_mode", "PORTUGUÊS","https://blog.flaviarita.com/wp-content/uploads/2020/03/Imagem1-1.png", "Adjectives Describe NounsIn Spanish, adjetivos can be used to describe a person place or thing, and are most often found immediately before the noun. For example, the sentence Tom is an excellent singer / Tom es un excelente cantante,");';
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("CRASE", "Icons.explicit", "PORTUGUÊS","https://infinittusexatas.com.br/wp-content/uploads/2021/07/crase-mapa-mental-6.png", "A crase é o fenômeno da contração da preposição a com o artigo feminino a e com certos pronomes cuja letra inicial também é o a. O fenômeno da crase é indicado ortograficamente através do uso do acento grave. Exemplos: Gosto de comida à mineira.");';
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("GEOMETRIA PLANA",  "Icons.calculate", "MATEMÁTICA", "http://3.bp.blogspot.com/-yXKli2GIO2A/Tt9Y0QBIktI/AAAAAAAAAUQ/1oomMYWZuOg/s1600/figuras_geometricas21.jpg", "A geometria plana ou euclidiana é a vertente da matemática que estuda as figuras geométricas que não possuem volume, como triângulos, retângulos, círculos, entre outros.Criado pelo matemático Euclides de Alexandria, a geometria plana vai explorar as propriedades e tamanho das formas, além de aplicar fórmulas matemáticas para descobrir seu perímetro e área. Esta área apresenta certas propriedades que nos ajudam a compreender as figuras mais complexas, como os conceitos de ponto, linha, plano e ângulo.");';
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("GEOMETRIA ESPACIAL", "Icons.category", "MATEMÁTICA", "https://s5.static.brasilescola.uol.com.br/be/2022/08/poliedros-coloridos.jpg",  "A geometria espacial é a análise de sólidos no espaço, ou seja, é a geometria para objetos tridimensionais, diferente da geometria plana, que é o estudo de figuras bidimensionais. Assim como esta, aquela surge com base em conceitos primitivos, sendo eles: ponto, reta, plano e espaço.");';
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("GEOMETRIA ANALITICA",  "Icons.circle", "MATEMÁTICA", "https://s1.static.brasilescola.uol.com.br/be/conteudo/images/formas-geometricas-estudadas-com-auxilio-algebra-57b71f717e258.jpg",  "A geometria espacial é a análise de sólidos no espaço, ou seja, é a geometria para objetos tridimensionais, diferente da geometria plana, que é o estudo de figuras bidimensionais. Assim como esta, aquela surge com base em conceitos primitivos, sendo eles: ponto, reta, plano e espaço.");';
    await db.execute(sql);

    sql = 'insert into Subject(subjectAssunt, title, iconName, titleappbar, imageLink, concept) values ("PRÉ-HISTÓRIA", "Icons.history_edu", "HISTÓRIA", "https://st.depositphotos.com/1000647/2294/i/600/depositphotos_22942090-stock-photo-vintage-magnifying-glass-lies-on.jpg", "A Pré-história é o período mais longo da História da humanidade. Começou a cerca de 2.500.000 anos e terminou com o surgimento da escrita por volta de 3.000 a.C. na Mesopotâmia, com os sumérios. De acordo com a utilização da tecnologia entre os hominídeos, a Pré-História é dividida em Idade da Pedra e Idade dos Metais.");';
    await db.execute(sql);
  }

  Future<void> fullFillObjects({
    required int totalLength,
    required Database db,
  }) async {

    String sql;
    //List<dynamic> titleList = [];
    dynamic title;
    dynamic icon;
    dynamic titleAppBar;
    dynamic imagem;
    dynamic conceito;

    for (var i = 0; i < totalLength; i++) {
      sql = 'SELECT * '
          'FROM Title '
          "WHERE titleID = '$i'; ";
      title = await db.rawQuery(sql);
      //await titleList.add(title);

      sql = 'SELECT * '
          'FROM Icon '
          "WHERE iconID = '$i'; ";
      icon = await db.rawQuery(sql);

      sql = 'SELECT * '
          'FROM TitleAppBar '
          "WHERE titleappbarID = '$i'; ";
      titleAppBar = await db.rawQuery(sql);

      sql = 'SELECT * '
          'FROM Image '
          "WHERE imageID = '$i'; ";
      imagem = await db.rawQuery(sql);

      sql = 'SELECT * '
          'FROM Concept '
          "WHERE conceptID = '$i'; ";
      conceito = await db.rawQuery(sql);
      //conceito é do tipo QueryResultSet
      //conceito[0] é do tipo RowQuery
      print(conceito[0]);
      print(conceito[0].runtimeType);


      //transformar o json para alguma coisa e usar para criar as variáveis
    }
  }
}
