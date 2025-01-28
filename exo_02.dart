
/// ROBOPOLIS - Division Innovation & Logistiqu

// Mission : Développer la fonction calculerTrajet(int distance) intégrant nos protocoles d'optimisation énergétique.

// Protocole Énergétique Principal :


// Fonction principale pour calculer le trajet
void main() {
  // Définir la distance souhaitée
  int distance = 75; // Vous pouvez modifier cette distance

  // Appeler les protocoles
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
  print("\nConfiguration du trajet pour $distance km :");
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
  print("\nProtocole Points de Contrôle :");
  print("- Points de ravitaillement : $pointsDeRavitaillement");
}

// Protocole de Sécurité : Vérifier les points de puissance et les limites opérationnelles
void protocoleSecurite(int distance) {
  print("\nProtocole de Sécurité :");

  // Vérification des "Points de Puissance" (distances = 2^n)
  bool estPointDePuissance = (distance & (distance - 1)) == 0;

  // Analyse des limites opérationnelles
  if (distance < 10 || distance > 100) {
    print("- Alarme de sécurité activée : Distance hors limites (min : 10 km, max : 100 km)");
  } else {
    print("- Distance dans les limites opérationnelles.");
  }

  // Afficher si la distance est un point de puissance
  if (estPointDePuissance) {
    print("- Distance $distance km est un Point de Puissance (2ⁿ).");
  } else {
    print("- Distance $distance km n'est pas un Point de Puissance.");
  }
}
