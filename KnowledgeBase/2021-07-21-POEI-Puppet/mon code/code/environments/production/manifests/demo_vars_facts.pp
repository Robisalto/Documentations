# classe de demo d'utilisation de variables
class demo_vars {

  # Variable de type 'String'
  $mavarstring = "exemple var string"

  # Variable déclarée mais vide
  $futurevar = undef

  # Variable type int
  $int_var = 2021

  # Utilisation de variable
  notify {'Contenu des variables':
    message => "Valeur de mavarstring: ${mavarstring} et Valeur de futurvar: ${futurevar} et Valeur de int_var: ${int_var}",
  }  

  notify {'INT_VAR':
    message => "int_var = ${int_var} ",
  }

  # Création d'un tableau
  $tableau = ['puppet', '7.9.0']

  notify {'Tableau':
    message => " Programme: ${tableau[0]} et Version: ${tableau[1]} \n",
  }

  # Creation d'un hash (dictionnaire)
  $hash = [
    {
      'name' => 'user1',
      'home' => '/prd/user1'
    },
    {
      'name' => 'user2',
      'home' => '/dev/user2'
    }
  ]

  notify {'Hash':
    message => "${hash[0]['home']}",
  }


  # Afficher l'OS family et la Distribution
  notify {'Utilisation de FACTS':
    message => "Famille: ${facts['os']['family']} et Distribution: ${facts['os']['distro']['codename']} ",
  }
  
  
  
  
  } # EOF
