/// ROBOPOLIS - Division Innovation & Logistique

// Mission : Développer la fonction calculerTrajet(int distance) intégrant nos protocoles d'optimisation énergétique.

import 'dart:io';

// Fonction principale
void main() {
  print("=== Bienvenue dans le programme de configuration du trajet ! ===");

  // Appeler la fonction pour obtenir la distance de l'utilisateur
  int distance = obtenirDistanceUtilisateur();

  // Appeler les protocoles avec la distance donnée
  protocoleEnergetiquePrincipal(distance);
  protocoleGestionEnergie(distance);
  protocolePointsDeControle(distance);
  protocoleSecurite(distance);
}

// Protocole Énergétique Principal : Identifier le type de route et calculer les recharges nécessaires
void protocoleEnergetiquePrincipal(int distance) {
  // Identification du type de route
  String mode = (distance % 2 == 0) ? "Route Rapide" : "Route Éco";

  // Calcul des points de recharge nécessaires
  const int capaciteBatterie = 10; // km par charge
  int nombreRecharges = (distance / capaciteBatterie).ceil(); // Arrondi au supérieur

  // Afficher les résultats
  print("\n🔋 Protocole Énergétique Principal");
  print("- Configuration du trajet pour $distance km :");
  print("- Mode activé : $mode");
  print("- Nombre de recharges nécessaires : $nombreRecharges");
}

// Protocole de Gestion d'Énergie : Estimer la consommation et appliquer le boost longue distance
void protocoleGestionEnergie(int distance) {
  // Estimation de la consommation énergétique (distance²)
  int consommation = distance * distance;

  // Application du Boost Longue Distance
  if (distance > 50) {
    consommation = (consommation * 1.2).ceil(); // Ajout de 20% si distance > 50 km
  }

  // Afficher les résultats
  print("\n⚡ Protocole de Gestion d'Énergie");
  print("- Consommation énergétique estimée : $consommation unités");
}

// Protocole Points de Contrôle : Générer les points de ravitaillement et les formater
void protocolePointsDeControle(int distance) {
  // Génération des points de ravitaillement tous les 5 km
  List<String> pointsDeRavitaillement = [];
  for (int i = 5; i <= distance; i += 5) {
    pointsDeRavitaillement.add(i.toString().padLeft(3, '0') + " km");
  }

  // Afficher les résultats
  print("\n📍 Protocole Points de Contrôle");
  print("- Points de ravitaillement : $pointsDeRavitaillement");
}

// Protocole de Sécurité : Vérifier les points de puissance et les limites opérationnelles
void protocoleSecurite(int distance) {
  print("\n🔒 Protocole de Sécurité :");

  // Vérification des "Points de Puissance" (distances = 2^n)
  bool estPointDePuissance = (distance & (distance - 1)) == 0;

  // Analyse des limites opérationnelles
  if (distance < 10 || distance > 100) {
    print("- 🚨 Alarme de sécurité activée : Distance hors limites (min : 10 km, max : 100 km)");
  } else {
    print("- ✅ Distance dans les limites opérationnelles.");
  }

  // Afficher si la distance est un point de puissance
  if (estPointDePuissance) {
    print("- Distance $distance km est un Point de Puissance (2ⁿ).");
  } else {
    print("- Distance $distance km n'est pas un Point de Puissance.");
  }
}

// Fonction pour demander à l'utilisateur d'entrer la distance
int obtenirDistanceUtilisateur() {
  while (true) {
    print("\nVeuillez entrer la distance en kilomètres :");
    String? input = stdin.readLineSync(); // Lire l'entrée utilisateur

    // Vérifier si l'entrée est valide
    if (input != null && int.tryParse(input) != null) {
      return int.parse(input); // Retourner la distance valide
    } else {
      print("⚠️ Entrée invalide. Veuillez entrer un nombre entier.");
    }
  }
}
