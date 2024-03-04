import 'package:flutter/material.dart';
import 'inscription_page.dart';

class ConnexionPage extends StatefulWidget {
  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      // Ici, vous pouvez ajouter votre logique pour tenter la connexion
      print('Email: $_email, Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de Connexion'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _email = value ?? '';
                  },
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Veuillez entrer un email valide.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  onSaved: (value) {
                    _password = value ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.length < 7) {
                      return 'Le mot de passe doit contenir au moins 7 caractères.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _trySubmitForm,
                  child: Text('Se connecter'),
                ),
                SizedBox(height: 20), // Espace supplémentaire entre le bouton et le texte
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vous n’avez pas de compte ? '),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InscriptionPage()), // Assurez-vous d'avoir une InscriptionPage
                        );
                      },
                      child: Text('S\'inscrire', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

