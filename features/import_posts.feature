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
                    "markdown": "You're live!",
                    "published_at": "2014-02-21T01:14:57.000Z"
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_posts" should exist
    Then the file "_posts/2014-02-21-welcome-to-ghost.markdown" should contain:
    """
    You're live!
    """
