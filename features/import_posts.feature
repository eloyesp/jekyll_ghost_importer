Feature: Import posts
  As a Ghost user that have a lot of posts written in the ghost plataform.
  In order to try Jekyll.
  I want to import the posts that I already written.

  Scenario: Import a backup file
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "slug": "welcome-to-ghost",
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_posts" should exist
