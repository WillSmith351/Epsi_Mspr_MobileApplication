import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String? _selectedRole = 'propriétaire';
  String _firstName = ''; // Variable pour stocker le prénom
  String _lastName = '';  // Variable pour stocker le nom

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      _formKey.currentState?.save();
      print('Email: $_email, Password: $_password, Role: $_selectedRole, FirstName: $_firstName, LastName: $_lastName');
      // Ici, vous pouvez ajouter votre logique pour traiter l'inscription
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
                  decoration: InputDecoration(labelText: 'Prénom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un prénom.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value!;
                  },
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
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
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  decoration: InputDecoration(labelText: 'Rôle'),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                  items: <String>['propriétaire', 'gardien', 'botaniste']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _trySubmitForm,
                  child: Text('S\'inscrire'),
                ),
                TextButton(
                  onPressed: () {
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
