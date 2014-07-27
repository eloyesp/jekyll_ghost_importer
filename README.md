# Jekyll ghost importer

This program let you import your post on [ghost][1] to [jekyll][2]. It uses a
[ghost backup][3] to read the data and creates posts and drafts from them.

## Installation

    $ gem install jekyll_ghost_importer

## Usage

Make a backup of your posts. Copy the file to the folder where you have your
jekyll blog, run:

    $ jekyll_ghost_importer GhostBackup.json

And then follow the instructions.

## Contributing

1. Fork it ( https://github.com/eloyesp/jekyll-ghost-importer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.

If you need to use this under different terms please write me directly.
