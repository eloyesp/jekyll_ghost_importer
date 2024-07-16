Feature: Import posts
  As a Ghost user that have a lot of posts written in the ghost plataform.
  In order to try Jekyll.
  I want to import the posts that I already written.

  Scenario: Import a simple backup file
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "title": "Welcome to Ghost",
                    "slug": "welcome-to-ghost",
                    "markdown": "You're live!",
                    "featured": 0,
                    "status": "published",
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
    ---
    layout: post
    title: Welcome to Ghost
    date: '2014-02-21 01:14:57'
    ---

    You're live!
    """

  Scenario: Import a simple backup file with posts in mobiledoc format
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "title": "Welcome to Ghost",
                    "slug": "welcome-to-ghost",
                    "mobiledoc": "{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"You're live with mobiledoc!\"}]],\"sections\":[[10,0]]}",
                    "featured": 0,
                    "status": "published",
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
    ---
    layout: post
    title: Welcome to Ghost
    date: '2014-02-21 01:14:57'
    ---

    You're live with mobiledoc!
    """

  Scenario: Import a backup file with two posts.
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "id": 1,
                    "uuid": "1425c966-bff2-4e32-98f6-222b4a7059e5",
                    "title": "Welcome to Ghost",
                    "slug": "welcome-to-ghost",
                    "markdown": "You're live!",
                    "image": null,
                    "featured": 0,
                    "page": 0,
                    "status": "published",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "author_id": 1,
                    "created_at": "2014-02-21T01:14:57.000Z",
                    "created_by": 1,
                    "updated_at": "2014-02-21T01:14:57.000Z",
                    "updated_by": 1,
                    "published_at": "2014-02-21T01:14:57.000Z",
                    "published_by": 1
                },
                {
                    "id": 2,
                    "uuid": "1d901d55-c286-427a-8b9b-16a7f37a8a8e",
                    "title": "Tengo otro blog",
                    "slug": "tengo-otro-blog",
                    "markdown": "Y con este ya son tres.",
                    "image": null,
                    "featured": 0,
                    "page": 0,
                    "status": "published",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "author_id": 1,
                    "created_at": "2014-02-21T02:31:55.000Z",
                    "created_by": 1,
                    "updated_at": "2014-02-21T02:31:55.000Z",
                    "updated_by": 1,
                    "published_at": "2014-02-21T02:31:55.000Z",
                    "published_by": 1
                }
            ],
            "users": [
                {
                    "id": 1,
                    "uuid": "992a86cc-bca7-400e-affe-9df3fb17d27e",
                    "name": "eloyesp",
                    "slug": "eloy",
                    "password": "$2a$10$6saUGJvuZXHR3SAY5tSevumPoHmrmHzB9QRM3Zx.eugBcFqvlscva",
                    "email": "eloyesp@gmail.com",
                    "image": "//www.gravatar.com/avatar/224f5b1b5ee448ec8152236ede91908c?d=404",
                    "cover": null,
                    "bio": "",
                    "website": "eloyesp@gmail.com",
                    "location": "",
                    "accessibility": null,
                    "status": "active",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "last_login": null,
                    "created_at": "2014-02-21T01:15:40.000Z",
                    "created_by": 1,
                    "updated_at": "2014-05-25T02:00:35.000Z",
                    "updated_by": 1
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then the following files should exist:
      | _posts/2014-02-21-welcome-to-ghost.markdown |
      | _posts/2014-02-21-tengo-otro-blog.markdown  |

  Scenario: Import a backup file with drafts
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "id": 5,
                    "title": "Something Software",
                    "slug": "something-software",
                    "markdown": "Something here",
                    "image": null,
                    "featured": 0,
                    "page": 0,
                    "status": "draft",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "author_id": 1,
                    "created_at": "2014-03-04T23:22:48.000Z",
                    "created_by": 1,
                    "updated_at": "2014-03-11T23:50:56.000Z",
                    "updated_by": 1,
                    "published_at": null,
                    "published_by": null
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_drafts" should exist
    Then the file "_drafts/something-software.markdown" should contain:
    """
    Something here
    """

  Scenario: Import a backup file with the new format
    Given a file named "GhostBackup.json" with:
    """
    {
        "db": [
            {
                "data": {
                    "posts": [
                        {
                            "title": "Welcome to Ghost",
                            "slug": "welcome-to-ghost",
                            "markdown": "You're live!",
                            "featured": 0,
                            "status": "published",
                            "published_at": "2014-02-21T01:14:57.000Z"
                        }, {
                            "id": 2,
                            "uuid": "1d901d55-c286-427a-8b9b-16a7f37a8a8e",
                            "title": "Tengo otro blog",
                            "slug": "tengo-otro-blog",
                            "markdown": "Y con este ya son tres.",
                            "image": null,
                            "featured": 0,
                            "page": 0,
                            "status": "published",
                            "language": "en_US",
                            "meta_title": null,
                            "meta_description": null,
                            "author_id": 1,
                            "created_at": "2014-02-21T02:31:55.000Z",
                            "created_by": 1,
                            "updated_at": "2014-02-21T02:31:55.000Z",
                            "updated_by": 1,
                            "published_at": "2014-02-21T02:31:55.000Z",
                            "published_by": 1
                        }, {
                            "id": 5,
                            "title": "Something Software",
                            "slug": "something-software",
                            "markdown": "Something here",
                            "image": null,
                            "featured": 0,
                            "page": 0,
                            "status": "draft",
                            "language": "en_US",
                            "meta_title": null,
                            "meta_description": null,
                            "author_id": 1,
                            "created_at": "2014-03-04T23:22:48.000Z",
                            "created_by": 1,
                            "updated_at": "2014-03-11T23:50:56.000Z",
                            "updated_by": 1,
                            "published_at": null,
                            "published_by": null
                        }
                    ]
                }
            }
        ]
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_posts" should exist
    And the following files should exist:
      | _posts/2014-02-21-welcome-to-ghost.markdown |
      | _posts/2014-02-21-tengo-otro-blog.markdown  |
    And the file "_posts/2014-02-21-welcome-to-ghost.markdown" should contain:
    """
    ---
    layout: post
    title: Welcome to Ghost
    date: '2014-02-21 01:14:57'
    ---

    You're live!
    """
    And a directory named "_drafts" should exist
    And the file "_drafts/something-software.markdown" should contain:
    """
    Something here
    """

  Scenario: Import a backup file with a new format
    Given a ghost backup file version 003 with some sample posts
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then it should pass with:
    """
    3 posts imported ( 1 draft )
    """
    And a directory named "_posts" should exist
    And the following files should exist:
      | _posts/2015-02-19-welcome-to-ghost.markdown |
      | _posts/2015-02-19-new_post.markdown  |
    And the file "_posts/2015-02-19-welcome-to-ghost.markdown" should contain:
    """
    ---
    layout: post
    title: Welcome to Ghost
    date: '2015-02-19 11:49:14'
    tags:
    - getting-started
    ---

    You're live!
    """
    And a directory named "_drafts" should exist
    And the file "_drafts/test-draft.markdown" should contain:
    """
    Something here
    """

  Scenario: Import a backup file with version 004
    Given a ghost backup file version 004 with some sample posts
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then it should pass with:
    """
    Importing _posts/2016-05-31-the-makers-guide-to-the-zombie-apocalypse.markdown
    1 posts imported ( 0 draft )
    """
    And a directory named "_posts" should exist
    And the following files should exist:
      | _posts/2016-05-31-the-makers-guide-to-the-zombie-apocalypse.markdown |
    And the file "_posts/2016-05-31-the-makers-guide-to-the-zombie-apocalypse.markdown" should contain:
    """
    ---
    layout: post
    title: The Maker's Guide to the Zombie Apocalypse
    date: '2016-05-31 20:03:23'
    tags:
    - the-makers-guide-to-the-zombie-apocalypse
    ---

    [The Maker's Guide to the Zombie Apocalypse](http://amzn.to/1spRddk), a book written by Simon Monk (who I gather is quite well known within the maker community, having [authored various books](http://amzn.to/1spRqwW) on the Arduino and Raspberry Pi)
    """

  Scenario: Import a backup file with version 004
    Given a ghost backup file version 004 with some sample posts
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then it should pass with:
    """
    Importing _posts/2023-12-29-moses-responding-to-gods-call.markdown
    1 posts imported ( 0 draft )
    """
    And a directory named "_posts" should exist
    And the following files should exist:
      | _posts/2023-12-29-moses-responding-to-gods-call.markdown |
    And the file "_posts/2023-12-29-moses-responding-to-gods-call.markdown" should contain:
    """
    ---
    layout: post
    title: 'Moses: Responding to God’s call'
    date: '2023-12-29 02:17:00'
    tags:
    - bible-study
    ---

    _This is an original lesson outline I prepared for one of my weekly Bible studies in 2023._

    - We know how God has used Moses for the special assignment of leading the Israelites out of Egypt towards the Promised Land.
    - But before this, Moses had to be called by God. In the popular Sunday School story, God appeared to Moses in a burning bush (Exodus 3:1-10).
    - At first, Moses had many reservations about the call, even telling God to “please send someone else” (Exodus 4:13).
    - Like Moses, God has called us to fulfill certain assignments in life (family, career, business, etc), and we want to accomplish them in Jesus’ Name.&nbsp;
    - So today, we’ll look at how God responds to Moses’ reservations/excuses, which happen to parallel the same excuses we typically make when presented with these great dreams, goals, and plans God plants in our hearts.

    """

  Scenario: Import a draft with an invalid published_at date
    Given a file named "draft_with_invalid_date.json" with:
    """
    {
        "db": [
            {
                "meta": {
                    "exported_on": 1424346829618,
                    "version": "003"
                },
                "data": {
                "posts": [
                  {
                      "id": 824,
                      "uuid": "3f932273-14ef-4a7d-8119-25cfee021b0c",
                      "title": "Are you using a fixed width font for development?",
                      "slug": "temp-slug-9",
                      "markdown": "This is just a draft, so the date doesn't really matter",
                      "html": "<p>This is just a draft, so the date doesn't really matter</p>",
                      "image": null,
                      "featured": 0,
                      "page": 0,
                      "status": "draft",
                      "language": "en_US",
                      "meta_title": null,
                      "meta_description": null,
                      "author_id": 1,
                      "created_at": "2013-05-22T08:30:25.000Z",
                      "created_by": 1,
                      "updated_at": "2013-05-22T08:30:25.000Z",
                      "updated_by": 1,
                      "published_at": "0000-00-00 00:00:00",
                      "published_by": 1,
                      "visibility": "public",
                      "mobiledoc": null
                   }
                 ],
                 "users": [
                        {
                            "id": 1,
                            "uuid": "6a013e8f-24d3-4c77-901a-7e57f6537f47",
                            "name": "test test2",
                            "slug": "test",
                            "password": "some_password",
                            "email": "my_email",
                            "image": null,
                            "cover": null,
                            "bio": null,
                            "website": null,
                            "location": null,
                            "accessibility": null,
                            "status": "active",
                            "language": "en_US",
                            "meta_title": null,
                            "meta_description": null,
                            "last_login": 1424346712870,
                            "created_at": 1424346562473,
                            "created_by": 1,
                            "updated_at": 1424346712870,
                            "updated_by": 1
                        }
                    ],
                    "tags": [
                        {
                            "id": 1,
                            "uuid": "befcb6c7-c777-4a65-a272-6e2577cade61",
                            "name": "Getting Started",
                            "slug": "getting-started",
                            "description": null,
                            "image": null,
                            "hidden": 0,
                            "parent_id": null,
                            "meta_title": null,
                            "meta_description": null,
                            "created_at": 1424346554967,
                            "created_by": 1,
                            "updated_at": 1424346554967,
                            "updated_by": 1
                        }
                    ],
                    "posts_tags": [
                        {
                            "id": 1,
                            "post_id": 1,
                            "tag_id": 1
                        }
                    ]
                }
            }
        ]
    }
    """
    When I run `jekyll_ghost_importer draft_with_invalid_date.json`
    Then it should pass with:
    """
    1 posts imported ( 1 draft )
    """
    And a directory named "_drafts" should exist
    And the file "_drafts/temp-slug-9.markdown" should contain:
    """
    ---
    layout: post
    title: Are you using a fixed width font for development?
    ---
    
    This is just a draft, so the date doesn't really matter
    """
