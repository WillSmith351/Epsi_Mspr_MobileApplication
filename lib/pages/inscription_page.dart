import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  // Ajoutez d'autres champs si nécessaire

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      _formKey.currentState?.save();
      // Ici, vous pouvez ajouter votre logique pour traiter l'inscription
      print('Email: $_email, Password: $_password');
      // Par exemple, envoyer les données à une API backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page d'inscription"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Veuillez entrer un email valide.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 7) {
                      return 'Le mot de passe doit contenir au moins 7 caractères.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _trySubmitForm,
                  child: Text('S\'inscrire'),
                ),
                TextButton(
                  onPressed: () {
                    // Code pour retourner à la page de connexion
                    Navigator.of(context).pop();
                  },
                  child: Text('Vous avez déjà un compte? Connectez-vous'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
