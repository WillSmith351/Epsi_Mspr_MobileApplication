import 'package:flutter/material.dart';

class BotAccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Ajoute du padding autour de la colonne centrale
          child: Column(
            mainAxisSize: MainAxisSize.min, // Pour centrer les cartes
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Bords arrondis
                  side: BorderSide(color: Colors.green), // Bords verts
                ),
                elevation: 4, // Pour l'ombre
                shadowColor: Colors.green.withOpacity(0.5), // Ombre verte
                child: ListTile(
                  title: Text(
                    'Poster une annonce',
                    style: TextStyle(color: Colors.green), // Texte vert
                  ),
                  leading: Icon(Icons.add_circle_outline, color: Colors.green), // Icône verte
                ),
              ),
              SizedBox(height: 16), // Espace entre les cartes
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Bords arrondis
                  side: BorderSide(color: Colors.green), // Bords verts
                ),
                elevation: 4, // Pour l'ombre
                shadowColor: Colors.green.withOpacity(0.5), // Ombre verte
                child: ListTile(
                  title: Text(
                    'Mes plantes',
                    style: TextStyle(color: Colors.green), // Texte vert
                  ),
                  leading: Icon(Icons.local_florist, color: Colors.green), // Icône verte
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Si vous avez plus de trois éléments
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message), // Icône de message
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // Ajoutez la logique de sélection de l'onglet ici
      ),
    );
  }
}