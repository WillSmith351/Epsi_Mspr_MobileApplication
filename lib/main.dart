import 'package:flutter/material.dart';
import 'pages/connexion_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arosa Je',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              SizedBox(
                width: 500, // Définissez la largeur souhaitée pour l'image
                height: 300, // Définissez la hauteur souhaitée pour l'image
                child: Image.asset('assets/images/arosaje_logo.png', fit: BoxFit.contain),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0), // Réduit l'espace au-dessus du texte à 5.0 unités
                child: Text(
                  'Faites garder vos plantes pendant votre absence. Vous avez une âme de botaniste ?\nPartagez vos conseils avec d\'autres \nutilisateurs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),

              Spacer(),
              Container(
                height: 60, // Hauteur du bouton
                width: 250, // Largeur du bouton
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.shade700, // Vert foncé
                      Colors.green.shade400, // Vert clair
                    ],
                    begin: Alignment.topLeft, // Début du dégradé en haut à gauche
                    end: Alignment.bottomRight, // Fin du dégradé en bas à droite
                  ),
                  borderRadius: BorderRadius.circular(30), // Arrondir les coins du bouton
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ConnexionPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Fond transparent pour afficher le gradient
                    shadowColor: Colors.transparent, // Aucune ombre
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Arrondir les coins du bouton
                    ),
                  ),
                  child: Text(
                    'Commencer',
                      style: TextStyle(
                      fontSize: 25, // Taille du texte
                      color: Colors.white, // Couleur du texte
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
