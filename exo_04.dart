// RHYTHMIX - Division Innovation Musicale

// Fonction principale
void main() {
  List<Map<String, dynamic>> playlist = [
    {"titre": "Song A", "duree": 3.5},
    {"titre": "Song C", "duree": 4.2},
    {"titre": "Song B", "duree": 2.8}
  ];

  // Exemple d'utilisation
  gererPlaylist(playlist, "ajout", {"titre": "Song D", "duree": 3.7});
  gererPlaylist(playlist, "suppression", {"titre": "Song A"});
  gererPlaylist(playlist, "tri", {"ordre": "A→Z"});
  gererPlaylist(playlist, "stats", {});
}

// Fonction pour gérer la playlist
void gererPlaylist(List<Map<String, dynamic>> playlist, String mode, Map<String, dynamic> param) {
  switch (mode) {
    case "ajout":
      // ✅ Mode Ajout : Ajout d'une nouvelle chanson en fin de liste
      if (param.containsKey("titre") && param.containsKey("duree")) {
        playlist.add({"titre": param["titre"], "duree": param["duree"]});
        print("🎵 Ajout : ${param['titre']} ajouté à la playlist.");
      } else {
        print("⚠️ Erreur : Données incomplètes pour l'ajout.");
      }
      break;

    case "suppression":
      // ✅ Mode Suppression : Retrait d'une chanson spécifiée
      playlist.removeWhere((chanson) => chanson["titre"] == param["titre"]);
      print("🗑 Suppression : ${param['titre']} retiré de la playlist.");
      break;

    case "tri":
      // ✅ Mode Tri : Alphabétique (A→Z et Z→A)
      if (param["ordre"] == "A→Z") {
        playlist.sort((a, b) => a["titre"].compareTo(b["titre"]));
        print("🎼 Playlist triée de A à Z.");
      } else if (param["ordre"] == "Z→A") {
        playlist.sort((a, b) => b["titre"].compareTo(a["titre"]));
        print("🎼 Playlist triée de Z à A.");
      } else {
        print("⚠️ Erreur : Ordre de tri invalide.");
      }
      break;

    case "stats":
      // ✅ Mode Stats : Nombre total et durée moyenne des morceaux
      if (playlist.isNotEmpty) {
        int totalMorceaux = playlist.length;
        double dureeMoyenne = playlist.map((chanson) => chanson["duree"]).reduce((a, b) => a + b) / totalMorceaux;

        print("\n📊 Stats :");
        print("- Nombre total de morceaux : $totalMorceaux");
        print("- Durée moyenne des morceaux : ${dureeMoyenne.toStringAsFixed(2)} min");
      } else {
        print("📊 Stats : La playlist est vide.");
      }
      return; // On évite d'afficher la playlist après les stats

    default:
      print("⚠️ Erreur : Mode inconnu.");
  }

  // Affichage de la playlist mise à jour
  printPlaylist(playlist);
}

// Fonction utilitaire pour afficher la playlist
void printPlaylist(List<Map<String, dynamic>> playlist) {
  print("\n🎶 Playlist actuelle :");
  for (var chanson in playlist) {
    print("- ${chanson['titre']} (${chanson['duree']} min)");
  }
  print("\n");
}
